Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C377C48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvYVirxxYrcEoYPYhVtajEjzNx9trrhQLd3ahVDvBX0=; b=mG/KxALALWcA7BGWZwUy+4xHT9
	konoBBvMD+yN0pcTQE5jWhl4QZJrPfatJ0WRgpg1ZQua7MfQQkOssnmHHUKWLUa3UrrnGArbFjcKa
	OyCNwR0QbDxqNmQLABuRMSUwWzcOkltB/uGRlvZqvhpPpyQFI50l6gqProsqdM+GG6eDkrLH5QGuu
	0uIWraoAyT+zPiDMqj3zCrna7bwlrUDIdXA64uRmMabtEzezXgpx1el+y4+7wCPf9peJ3Oyyg9v2b
	fF3Kwzj3OzlZ8hRo/4k/SZzqFJfMi1E4fvCS9jWk7tk1BQqBi8Clxa1kLIjTFpH/Pha9wy7qILLsZ
	tNRqhT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZyj-00000000XfQ-3WSE;
	Mon, 26 Feb 2024 12:21:05 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZye-00000000Xcl-29q7
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 12:21:03 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1dc5d0162bcso24553405ad.0
        for <ath11k@lists.infradead.org>; Mon, 26 Feb 2024 04:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708950059; x=1709554859; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvYVirxxYrcEoYPYhVtajEjzNx9trrhQLd3ahVDvBX0=;
        b=P4s9Q2kBUTyVeEWlsB3F12bXMkwEyuWoaNhTB2q1toxKfib8+SAdkYhEOfQDL2rpKV
         BQwJKUbWmlBvRJpuPyimvqyJbcBm4h4vbL2RLqNG6gtVgCHcFhulMg1vM+CrKzozFVHh
         5zmeZKhpMccAjIuZ82GIuYuBNHKcS/7kPiSqXdzpBQR65ociBFdwqtPn7hNwHGcRMYan
         ZJz7DUa8PkuWFKbdQHLZoDGMhg7/LyR14hO0D4Jhz900QmGjHg+A5d2YvBlPO1GsYhTT
         ZKqDL9Gajk87lyPMOBKdXHEVcpslrSLxQyCng9ezODs1nv1EEYYuYP4Mg9IKkYFIyGTC
         rjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950059; x=1709554859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvYVirxxYrcEoYPYhVtajEjzNx9trrhQLd3ahVDvBX0=;
        b=NElYO5lgeLvhOI8GSr13iKLowFyWs4/+q75PfGn/O8JjwrrPkm17APcPuJ8XUL8PjP
         BY9cMwx1iNMrqopvoEaOFdg5SBdAVjWCJOF4j/i6Jg3bmhg5RVaKnzMMmiZD6WyxXtXq
         Mita+X9L7d7J5b4AtUp1SuhcYu5PCTjgSwWjhinTII/vsEM/73B2U6hQ4vYV8p0AXtTP
         bnf1cZi6OmI6N5wEemaCKEnZMpjNP+0PSV+ksTrx2OVlAUFW0CHzhowU6Nv0GfrOQtwq
         cINvfx1CgQ5o7FpOA+6qZ1xV2WJKtRKUvekIeB4JtTxNZUIQoyJKYyv0tbEHUjU1d4hU
         I9FQ==
X-Gm-Message-State: AOJu0Yw1xmECOOeGLlqMqB536PndkC8ntTGScPSJE56OG3HNMORbO6JT
	VN51jT5vbCpIMu+dmODXJS5jaMwzdiweETU/U/77W3X1KZnz3O7S9j3VqpTT7A==
X-Google-Smtp-Source: AGHT+IFNO0EvqpSlsp90jIMoKkSHpuCVgm2eQEtRszipPHoVaXKCILn8GEKj9H06BqJROE7zrz5L0w==
X-Received: by 2002:a17:902:ba88:b0:1dc:266e:a7e2 with SMTP id k8-20020a170902ba8800b001dc266ea7e2mr6036261pls.11.1708950059447;
        Mon, 26 Feb 2024 04:20:59 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id jh5-20020a170903328500b001dcada71593sm888333plb.273.2024.02.26.04.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:20:59 -0800 (PST)
Date: Mon, 26 Feb 2024 17:50:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240226122055.GE8422@thinkpad>
References: <20240221030026.10553-1-quic_bqiang@quicinc.com>
 <20240221030026.10553-3-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221030026.10553-3-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_042100_748051_E3ABF576 
X-CRM114-Status: GOOD (  26.85  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, Feb 21, 2024 at 11:00:25AM +0800, Baochen Qiang wrote:
> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition.
> 

Again, below content should go to the comment section, not in the commit
message.

Please add only relevant content in the commit message.

- Mani

> The RFC version adds new API to MHI stack with which an MHI controller
> driver can do unprepare/prepare directly by itself, see
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20231127162022.518834-3-kvalo@kernel.org/
> 
> Although it works well Mani pointed out that the design is not good
> because MHI channels are managed by MHI client driver thus should not
> be touched by others. See the discussion
> 
> https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/
> 
> This version changes to add suspend/resume callbacks to achieve the
> same purpose. The suspend callback is called in the late suspend stage,
> this means MHI channels are still alive at suspend stage, and that makes
> it possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called in
> the early resume stage, for a similar reason.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  net/qrtr/mhi.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 9ced13c0627a..b54a6c2113e9 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -118,6 +118,32 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>  
> +static int qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +static int qcom_mhi_qrtr_pm_resume_early(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	int rc;
> +
> +	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	if (rc)
> +		dev_err(dev, "failed to prepare for autoqueue transfer %d\n", rc);
> +
> +	return rc;
> +}
> +
> +static const struct dev_pm_ops __maybe_unused qcom_mhi_qrtr_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
> +				     qcom_mhi_qrtr_pm_resume_early)
> +};
> +
>  static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.probe = qcom_mhi_qrtr_probe,
>  	.remove = qcom_mhi_qrtr_remove,
> @@ -126,6 +152,9 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.id_table = qcom_mhi_qrtr_id_table,
>  	.driver = {
>  		.name = "qcom_mhi_qrtr",
> +#ifdef CONFIG_PM
> +		.pm = &qcom_mhi_qrtr_pm_ops,
> +#endif
>  	},
>  };
>  
> -- 
> 2.25.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

