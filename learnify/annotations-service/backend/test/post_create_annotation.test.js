import chai from 'chai';
import chaiHttp from 'chai-http';
import jwt from "jsonwebtoken";
import app from '../app.js';


chai.use(chaiHttp);
const expect = chai.expect;

  describe('POST /annotations/:ls_id/:post_id', () => {
    it('should create a new annotation', async () => {
      const authHeader = jwt.sign({ username: 'testuser' }, process.env.JWT_KEY);
      const res = await chai.request(app)
        .post('/annotations/ls_id/post_id')
        .set('authorization', authHeader)
        .send({
        "@context":"http://www.w3.org/ns/anno.jsonld",
          type: 'AnnotationType',
          body: 'Annotation body',
          target: 'Annotation target'
        });
      expect(res).to.have.status(200);
      expect(res.body.resultMessage).to.equal('Annotation is succesfully created.');
      expect(res.body.annotation).to.have.property('_id');
      expect(res.body.annotation).to.have.property('type', 'AnnotationType');
      expect(res.body.annotation).to.have.property('body', 'Annotation body');
      expect(res.body.annotation).to.have.property('creator', 'testuser');
      expect(res.body.annotation).to.have.property('target', 'Annotation target');
    });

    it('should return 400 if validation fails', async () => {
      const authHeader = jwt.sign({ username: 'testuser' }, process.env.JWT_SECRET);
      const res = await chai.request(app)
        .post('/annotations/:ls_id/:post_id')
        .set('authorization', authHeader)
        .send({
          type: '', // invalid value
          body: 'Annotation body',
          target: 'Annotation target'
        });
      expect(res).to.have.status(400);
      expect(res.body.resultMessage).to.equal('Please check your inputs.');
    });

    it('should return 401 if auth token is invalid', async () => {
      const res = await chai.request(app)
        .post('/annotations/:ls_id/:post_id')
        .set('authorization', 'invalid')
        .send({
          type: 'AnnotationType',
          body: 'Annotation body',
          target: 'Annotation target'
        });
      expect(res).to.have.status(401);
      expect(res.body.resultMessage).to.equal('There is something wrong with your auth token.');
    });

})