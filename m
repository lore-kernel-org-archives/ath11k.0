Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9986C5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZsei3QWNYjEWHv4rj1KYROyeU0O84dua5Y6JN0udQc=; b=ZulXdzGmhQgiXo1e+npgYXgQnK
	pz3z5FH+Pnr2ybTFlBJIB+2sFRffL6XwyN8JmCN20x5M8J4vDvqlngQrZ/mQg+8CHGVWTCv8XWEqs
	JXZdREYmAZ4ZWL3cLMd6qYLlwsX748e7ED/CMe717uFl67BgIuxzJdzoiH77RKkzGo5lV3gLghfHE
	mQucLTjHNvuJMIiRbrNNk7Gw4xHtW20V2JrWf99guOucdAFjwHV1RO3OozLY4dKP1p1LKt+kTcm29
	8PWb54qpES4bsR6RusosOP9g728GQjL1jBCuxafigHsgmCqvUmJqvwI35c0spcQO0x5phASCwSpYB
	AhsQaQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rergh-000000045k1-20IC;
	Tue, 27 Feb 2024 07:15:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rergf-000000045iw-0uQK
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 07:15:38 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1dc09556599so34174125ad.1
        for <ath11k@lists.infradead.org>; Mon, 26 Feb 2024 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709018136; x=1709622936; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uZsei3QWNYjEWHv4rj1KYROyeU0O84dua5Y6JN0udQc=;
        b=MfSqSvd15pYtJ6GqIpHNSXp+uL4c/9h9gvqFEML5b3DJKz/BZpMzeBYYdMr6P8eBAX
         FrMMFPRx3wOM/H1pD9Kju6OCWVU8Cc1dBHrRJv2M0O0lWRbTEszIkYvFOBQKHmRQxPj9
         Y+KLFCua/bVsHtUMQc6dTFw4HCFTb56iqhaNvenmkdxPL+DyTX4H82lXrlxOoj73Vb1C
         Vc46GDS8Y4S5MmjLYKNNCiZZMJ1U+n+RXBX0c2Xrh16GlbbZyzVJdN7ZeIHo3QZO1NE9
         waYFBbR8DCx0w+eAyjyjwsme61FnTlo99jmdl0q62bgxeFBbgpqfEnxri9XysnVLNxP5
         2WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709018136; x=1709622936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZsei3QWNYjEWHv4rj1KYROyeU0O84dua5Y6JN0udQc=;
        b=retfFGdVocMNABiyxDJPqZT8aqCH0UCl2QXOte+6vRFZcujqAgK118McxL7tS3neoS
         U4hggPqLCBh+wsaaQgniU63smuOJutk46QTy6Y/Rze4AQ2r687TrZgCLZKyw3HQLiL7u
         3FWmHx0wFrbRthpDWJx5ll+r4d0PFigiz2Dy2LkeXVFkSz2T0u5o/wdKTG0HpgdSvMtU
         4njEIAXghd4uzY3dPiwnrith0PLM0RwFgtx2ayVcS2u3fJ497CEnzp76ybptdGYHtPsL
         ydxjP2X+u2S9X7SsBFd4P/ouFdkroQyaVZrUi1KYteqr2JCEckcvfNi2803Ey1aO8kQ9
         pyJw==
X-Gm-Message-State: AOJu0YwBNSF3Cb5S18yNpbmfz1y3hQe4LR7ZW0aVPC4CMqLEU5QQJAic
	gZp4ADM0RiL1920taefuZLkEcAWI1HX/thyDa6W48QraowlIc81tvgW76O+PRRSXB8LFzah4fnY
	=
X-Google-Smtp-Source: AGHT+IFibjJl0nFMxkStNH2v97+irfnxX0GXGBgtTqgJL/pFmNgfMwh9TcBG1L8V21fOgN6jL/Y6fQ==
X-Received: by 2002:a17:902:7ec8:b0:1db:cb54:5e77 with SMTP id p8-20020a1709027ec800b001dbcb545e77mr10479462plb.22.1709018136598;
        Mon, 26 Feb 2024 23:15:36 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id k22-20020a170902ba9600b001dcabf123c9sm813379pls.155.2024.02.26.23.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:15:36 -0800 (PST)
Date: Tue, 27 Feb 2024 12:45:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240227071531.GD2587@thinkpad>
References: <20240227063613.4478-1-quic_bqiang@quicinc.com>
 <20240227063613.4478-3-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227063613.4478-3-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_231537_280670_C72755F0 
X-CRM114-Status: GOOD (  21.97  )
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

On Tue, Feb 27, 2024 at 02:36:12PM +0800, Baochen Qiang wrote:
> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition, this is
> done by adding suspend/resume callbacks.
> 
> The suspend callback is called in the late suspend stage, this means
> MHI channels are still alive at suspend stage, and that makes it
> possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called
> in the early resume stage, for a similar reason.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Could you please confirm if this patch can be applied separately and won't cause
regression?

- Mani

> ---
>  net/qrtr/mhi.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 9ced13c0627a..e96b82a6742c 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -118,6 +118,32 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>  
> +static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
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
> +static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
> +				     qcom_mhi_qrtr_pm_resume_early)
> +};
> +
>  static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.probe = qcom_mhi_qrtr_probe,
>  	.remove = qcom_mhi_qrtr_remove,
> @@ -126,6 +152,7 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.id_table = qcom_mhi_qrtr_id_table,
>  	.driver = {
>  		.name = "qcom_mhi_qrtr",
> +		.pm = &qcom_mhi_qrtr_pm_ops,
>  	},
>  };
>  
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

