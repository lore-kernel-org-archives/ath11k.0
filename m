Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFEBC54E41
	for <ath11k@archiver.kernel.org>; Thu, 29 Feb 2024 10:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTSeHl4t56ihFRBLYPjJvNh39suZY1xPljTjFaZyy/Y=; b=nXCuJlGCvt2OBKd+uHYNrUJK/2
	bRWEbBJRoTxtUvnSL7Dj4X/XI4mQx9V3zCFm9bZ6cBmtRO17qEB59Ks1MUrdj6ccmd24UVXbvSu3c
	rpFur5IYEgaZWE/pKj4YbNPpHz/NmCG8ZxTCO9YFskLI7l87zy3NDN61QRJtms+A6IseV3A11J245
	EjWp87c4FZ4ck8yhx+aAXxY8/Z2upfwOpQlWjHZbt+r49lhbSMaJbHjD7AA2ouweEHD+7X8y9kTpg
	CdqVnfEd92v2X+8IwvCO+7432B29TTz2fvAXfdVMqF35Smin1gOzUgLQ79BKakfOGtkdW0+wKrLhG
	8tbM5HLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdPZ-0000000D5uG-3q79;
	Thu, 29 Feb 2024 10:13:09 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdPW-0000000D5s1-3ZW2
	for ath11k@lists.infradead.org;
	Thu, 29 Feb 2024 10:13:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6da9c834646so542213b3a.3
        for <ath11k@lists.infradead.org>; Thu, 29 Feb 2024 02:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709201586; x=1709806386; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTSeHl4t56ihFRBLYPjJvNh39suZY1xPljTjFaZyy/Y=;
        b=gNXL4SddP4wGDsnyPNls6V2yBkzUq3pFMMUKlYwHEdvJje+fsoOAT95RpDcGKr6Nb9
         hiDV82r5/1x7X/znYwKVDzUcSzTQABOvDhv0+JCshJzrYDddZcWwNvzu8pyaw2AHetzg
         rMEs4V9mSmSt7ep8pz4gS8kZdyKntJBwI7TK4q55/AeiuKwu3Si0u0x1s5q52yZHBp+N
         +LgBmZoZdCICCH9nCeI2r/xfLfDk6JR0yL0xsI81yzq2xcAmnA54cpxL0vC+SBZypYnR
         +b4oG2qGIwQJ4vGBJ2VDShu61QcKIQD//V1t3k2sTni3n8BlFjfLEkBEATo2lQW12lJt
         kP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709201586; x=1709806386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTSeHl4t56ihFRBLYPjJvNh39suZY1xPljTjFaZyy/Y=;
        b=rRxm76mx5Up42S66P6dl1aonQIFcDiW05a4B64dDm9MydEmc2UCC8qcauIP6ZGk5gk
         4o9Aj0wyPbEykdEXkfgNzARfmzzYslpe4PG/cHK7l4YrYgqCQZSzRywAJ7nD0sJYSGOh
         y3WX/pm0jmRa6wImKX2TwsQrrvktiijjQdhmvKBMRg3bwyT4cVj5fFgs2nTTjQKqi9cH
         BWpRXqxBWfWk6eFn95ODihY2LFUZwNlPBd0s4ABQ9iS0MQPmG4jW9GrRVMibtlljqs0U
         e71vVnWafss/wXh/+etHPEL8bN5WR772cal8BOi38U4DM72Nrw313+bRGcK8sODvo7Aq
         0zrg==
X-Gm-Message-State: AOJu0Yx46YEbMNrR2lok6WvRdhQzmAK/0w2wnhmt4ksYPCk2l9xWh0Bb
	p79MvDWkxuSL7bplBbqkZXkcccZOqhOxRWZN+O8JIp7Q26P/1Oyan5bOC2Fc3w==
X-Google-Smtp-Source: AGHT+IGygXML0wQBkJwD/GAHTQBBip4QFRiWJxFBsL4N97u47bRPEOg2GIwnNaxsGTOu/S/paGqlYw==
X-Received: by 2002:a05:6a20:9f09:b0:1a0:e17c:d771 with SMTP id mk9-20020a056a209f0900b001a0e17cd771mr2366560pzb.7.1709201585776;
        Thu, 29 Feb 2024 02:13:05 -0800 (PST)
Received: from thinkpad ([120.138.12.68])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001dcb654d1a5sm1069127plg.21.2024.02.29.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 02:13:05 -0800 (PST)
Date: Thu, 29 Feb 2024 15:42:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH v4 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240229101254.GC2999@thinkpad>
References: <20240228022243.17762-1-quic_bqiang@quicinc.com>
 <20240228022243.17762-3-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228022243.17762-3-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_021306_931548_3A1E9A69 
X-CRM114-Status: GOOD (  26.84  )
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

On Wed, Feb 28, 2024 at 10:22:42AM +0800, Baochen Qiang wrote:
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
> Also note that we won't do unprepare/prepare when MHI device is in
> suspend state because it's pointless if MHI is only meant to go through
> a suspend/resume transition, instead of a complete power cycle.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  net/qrtr/mhi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 9ced13c0627a..69f53625a049 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -118,6 +118,51 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>  
> +static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	enum mhi_state state;
> +
> +	state = mhi_get_mhi_state(mhi_dev->mhi_cntrl);
> +	/*
> +	 * If the device is in suspend state, then no need for the
> +	 * client driver to unprepare the channels.
> +	 */
> +	if (state == MHI_STATE_M3)
> +		return 0;
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	enum mhi_state state;
> +	int rc;
> +
> +	state = mhi_get_mhi_state(mhi_dev->mhi_cntrl);
> +	/*
> +	 * If the device is in suspend state, we won't unprepare channels
> +	 * in suspend callback, therefore no need to prepare channels when
> +	 * resume.
> +	 */
> +	if (state == MHI_STATE_M3)
> +		return 0;
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
> @@ -126,6 +171,7 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
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

