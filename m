Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE819C5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSLLi43HACJeFnFP6SO2dnx7por0WBtfnRzS4Kl+dFE=; b=GShH6MDfK56aN++aCz3rjwd3WZ
	dFFuLCU0A314gbaGhZownOQwEWej2WpIP1vvSUyoIUwVi/QroOoUFqqpORhumYPRZQIOyZXPdXAbk
	N6dkE/G6g1L6QHHI68bMUdWZky0bHerSrfrpQNr+WDmW5RmBTGt2Y6n5vqobXnaJ6a4M6ykimlB/T
	jMadPIYrsd7n3W49V23jpP5s8oA3TmgLh+lpqO3VN1R0Bdp8kQnYIJjRkU3iFjBb+04Pgv0URQrNQ
	hyZE4x5JwatrWxLUR5hkmbDN6P0JndmBwuz2fwFuZuzQmF5VfEUIsn1XiWfZDRL0OFzJsFVltX7QK
	72d+BpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewNm-0000000588k-1rbc;
	Tue, 27 Feb 2024 12:16:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewNW-0000000582x-3J0a
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 12:16:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1dbd32cff0bso30939205ad.0
        for <ath11k@lists.infradead.org>; Tue, 27 Feb 2024 04:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709036168; x=1709640968; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSLLi43HACJeFnFP6SO2dnx7por0WBtfnRzS4Kl+dFE=;
        b=DVFC8u0QUj995H0s7nkN/CW3NosP18ok1MGz2Clbdya1wXzg6hqSPxUgjt3ivNedXC
         rjVQh+Mi1TMK43LfRNURBcwqFDsJR9jggLt7Oa0i2ZP5z6jXFVpZA2S+wEG5CoFaGstH
         Tw6BdMn44cochZbHNcDjs/v8gN2J4at5Q0NVc2pUc8jvLvem1olj6oQV7wizmLciO4Z6
         fT0M8K3qMr4PZZLlEHXIkdrJlCSvXOqHOCYTaFSjis/UXcgGjAhs5Rjc77/ysmj4jxfq
         JFHBXQr6sHzdny22GJBI5N6qALVz048iS87oz4H47FJ50jk0/gL/GwdMNFYlpsrNj1Ku
         o8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709036168; x=1709640968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSLLi43HACJeFnFP6SO2dnx7por0WBtfnRzS4Kl+dFE=;
        b=soNWMlPCvkBzPhXqXldpHLu5RCbbRQVc9yWnOUKyhxnYeg+D65An00Z4M/zdoCLDtp
         BnExv2iNvsS49ejGz86GNsPRYNPkNs9+sLY/1h0lRp7cf49W9k7I/FSG+NoYcGu+2qlI
         uv7oxREO3yeMIhLEPdW565lJUhT7Fr4br7SnImd13fTvlvbsTIYOtrxUFxEKA1zvSVCZ
         il9HWiVNL8eoxKJmpSmN0nIAzXXkjrnS6puYG6GnL8Xu7AKED2zF/rbIhI/XpaEwfwWj
         imeHBwewCaSUHKZ9f295BkVtPk0z1/idnyVguCfAyDkrGjcixgH++bQTSI6UUoQPZWgx
         LLgw==
X-Gm-Message-State: AOJu0YxvmQ90VhibpFbw3AomdIFHbSaHfVJwOlz6zTrfiinRNlvtNUa9
	pSSmSLUgfTg5FfnVkVmxbIBifBo4lzlp/3mJKvSTH3O/46TtWx0I8SYPYaCvsA==
X-Google-Smtp-Source: AGHT+IH3s4jVwUk0+mZ0PnkQjYfLsEztotgFamFw6AI38DUq7t0+HX+BXSCN6Z/P0Ih71C7CE+4/+g==
X-Received: by 2002:a17:902:7c92:b0:1db:c3cb:b088 with SMTP id y18-20020a1709027c9200b001dbc3cbb088mr9769914pll.35.1709036168326;
        Tue, 27 Feb 2024 04:16:08 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709026b0900b001db693d89fdsm1405598plk.179.2024.02.27.04.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:16:08 -0800 (PST)
Date: Tue, 27 Feb 2024 17:46:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v3 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240227121602.GM2587@thinkpad>
References: <20240227104427.7505-1-quic_bqiang@quicinc.com>
 <20240227104427.7505-3-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227104427.7505-3-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_041610_958021_27BCAA73 
X-CRM114-Status: GOOD (  27.66  )
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

Btw, you forgot to CC netdev folks. Here is the list that get_maintainer.pl
returns:

"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING [GENERAL])
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING [GENERAL])
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING [GENERAL])
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING [GENERAL])
netdev@vger.kernel.org (open list:NETWORKING [GENERAL])

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

