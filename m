Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFD4C5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJLDRZfBIvlr7lerWpgs/xrh5kRQFmy2mrKRu1JKvyc=; b=hfdIsqDmt3qlbKSDgtxjcXUjHi
	4yFQO75KEk9IVBCVdf+vfItBnXC+aEHuzN4aV2FbOK4Ei1/FLz4g6KHk9vHPLSq9K8xF39jk9R5oO
	MKIfZ3eB9JcHCykOEhUihzKc0Qa+CTL07zRXVuPRs2FlfWx4CIsUTqF+LAxzelpDvVPt/TY4yuX10
	+l0mectIULFGOd8cvv1MwQ5tfr50PThtI6ppGf2YVnYK3+rSN36vVlIzM2Unpc9ZhmInUmR2YpqbV
	yXRIVcrXXoPU7XEKxFOiXWkeem7FrDP8J8jaCnMCe5ZhBhVk/zPlndjHRDCxYD1HdgP2POqLqVOkW
	aSYCKewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexK0-00000005LbH-3BJj;
	Tue, 27 Feb 2024 13:16:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewL4-000000056LQ-18a7
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 12:13:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e4c359e48aso2612820b3a.1
        for <ath11k@lists.infradead.org>; Tue, 27 Feb 2024 04:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709036016; x=1709640816; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJLDRZfBIvlr7lerWpgs/xrh5kRQFmy2mrKRu1JKvyc=;
        b=G+rV0u6aac2cEM+cyMOe9xq8qrRX4lcGQHLUGvyKXW+mtfIFOxXra/9YX6m5c0gJOH
         RvxcKP8lHN0SLYKUm8NU7Mt5CeyFe95RzjwZD/K97qPnYpkqZqwjTzAGt2fpNN98RSx6
         JVHQnVWCCVGqTkNpEEsV3tUcfHL2qYpF96qSZJtMrjeGKfSRswfI9P1nO0vSJBP9G95P
         0k6NUVFLgIQJ0tuVGZMJKh8CZV4xoWy/nFGn8LubV3RSWThnWGhZ4rYqNPhrP0WeYYMW
         cLDLnlHYoXM9GR5bvBt/JxT59DcKDmlCHWoOdEX/zPcluzeMghbp99l7nb8iOqwoyEao
         Ak7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709036016; x=1709640816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJLDRZfBIvlr7lerWpgs/xrh5kRQFmy2mrKRu1JKvyc=;
        b=rmMMlzSJ6L0wq2/xCXdr83DK1lXbK6hGtPZVIhr/HUGe/MUJpqoKQKhhaMQnklqkhC
         hZxTYt4V6kFhTBuXkefhWsyI4s2me6B0NONMBwIZhBFI94PzMpYoyVHYsXO6KBKhhh2z
         OPu1A2qRNUoru9jwAqZ6al/tUM564DQncfGU56KMibb8+ULKTNvYNCweOGD4pfxh/714
         FkzlOhoIGe4YqC/PxK33aWnNixPA+2PY9qOlwppYuuLllssjdOcuNVHJBL6c9iwo6/Yb
         GVPBfOR5AT4el7Uk80M7Gh8flsu3eKVnQiLTqPh9KHWfti2nAg6gCF05/xKKSi0jlD6t
         kBNw==
X-Gm-Message-State: AOJu0Yz+IIuOhkLOXRek29URG3vuKODdQ3+1iNycvSlxPhBQqGZa7oIu
	vRPvPiNl/1WFjOMucqdDquPYq9REUT9BHXBJmHt+/dRI9a5BI/nCLGBuMjFe1Q+BFXwZcUMUu3Q
	=
X-Google-Smtp-Source: AGHT+IGjxS8z4dBtBJgcXuzY+oK7lfPUpsSn+E9YZ/5dHJibyntUwmW17beAiUBhPM2LR0ImZwFjiA==
X-Received: by 2002:a05:6a00:2d20:b0:6e5:3ec7:c068 with SMTP id fa32-20020a056a002d2000b006e53ec7c068mr3942818pfb.24.1709036015957;
        Tue, 27 Feb 2024 04:13:35 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id r26-20020aa7845a000000b006e481014bf9sm5717110pfn.200.2024.02.27.04.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:13:35 -0800 (PST)
Date: Tue, 27 Feb 2024 17:43:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v3 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240227121329.GL2587@thinkpad>
References: <20240227104427.7505-1-quic_bqiang@quicinc.com>
 <20240227104427.7505-3-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227104427.7505-3-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_041338_617494_CA72A6F1 
X-CRM114-Status: GOOD (  26.74  )
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

On Tue, Feb 27, 2024 at 06:44:26PM +0800, Baochen Qiang wrote:
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

