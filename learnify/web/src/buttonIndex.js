import React, { Component } from "react";

export default class ButtonLoader extends Component {
  state = {
    loading: false,
    orange: true
  };

  changeColor(){
    this.setState({orange: !this.state.orange})
  }

  fetchData = () => {
    this.setState({ loading: true , orange: false});

    //Faking API call here
    setTimeout(() => {
      this.setState({ loading: false , orange: true});
    }, 180000);
  };

  render() {
    const { loading } = this.state;

    let btn_class = this.state.orange ? "btn-orange" : "btn-grey";

    return (
      <div>
        <button className={btn_class} onClick={this.fetchData} disabled={loading}>
          {loading && (
            <i
              className="fa fa-refresh fa-spin"
            />
          )}
          {loading && <span>Please Wait 3 Minutes Before Resending</span>}
          {!loading && <span>Resend</span>}
        </button>
      </div>
    );
  }
}
