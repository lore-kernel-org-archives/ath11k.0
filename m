Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keWyX-00066d-8I
 for ath11k@lists.infradead.org; Mon, 16 Nov 2020 05:22:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id 34so8940530pgp.10
 for <ath11k@lists.infradead.org>; Sun, 15 Nov 2020 21:22:48 -0800 (PST)
Date: Mon, 16 Nov 2020 10:52:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 2/2] net: qrtr: Start MHI channels during init
Message-ID: <20201116052238.GB3926@Mani-XPS-13-9360>
References: <1600674184-3537-1-git-send-email-loic.poulain@linaro.org>
 <1600674184-3537-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600674184-3537-2-git-send-email-loic.poulain@linaro.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Loic Poulain <loic.poulain@linaro.org>
Cc: davem@davemloft.net, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, netdev@vger.kernel.org, hemantk@codeaurora.org, ath11k@lists.infradead.org

+ath11k list

On Mon, Sep 21, 2020 at 09:43:04AM +0200, Loic Poulain wrote:
> Start MHI device channels so that transfers can be performed.
> The MHI stack does not auto-start channels anymore.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-ath11k-immutable branch! This branch will get merged into
mhi-next and ath-next.

Thanks,
Mani

> ---
>  v2: split MHI and qrtr changes in dedicated commits
> 
>  net/qrtr/mhi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index ff0c414..7100f0b 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -76,6 +76,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	struct qrtr_mhi_dev *qdev;
>  	int rc;
>  
> +	/* start channels */
> +	rc = mhi_prepare_for_transfer(mhi_dev);
> +	if (rc)
> +		return rc;
> +
>  	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
>  	if (!qdev)
>  		return -ENOMEM;
> -- 
> 2.7.4
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
