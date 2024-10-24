Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23823D0E3F3
	for <ath11k@archiver.kernel.org>; Thu, 24 Oct 2024 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odUCZ6i3Z9JVAJZgtcokijO9ujjlw7b3NCqdho3UKJk=; b=TxAw4o30l/EM1HqleeN72u7pHX
	WbhXQ6CcDFsUrYZZRUXXEqfCET3c89dxnv0FcEqiemx/J4L2f0PhtfpNstDzehGBgKx1fEZGsdkrF
	2VLBAuEstw5PmX/jt8Rh6CqhVijduldFjy2+6ue11eXblLbTZ9y4ht1cRCYkA2fp6B23Sn259gvIq
	gqyTnzHQQdphCNmzhLWyGTFiV/Kl0gIAhRXMIstWNsiZmrE/UGLdWK/VF0JGQoFc+puYtyG/8QWpQ
	TgO4PSOlxmqAwP3xtd3u9eLC71DIz7liyXGl+MBp1a9m3nGSZ+5TqPw18tGR0fRKJ4kW/KCDeWicA
	8d0wUlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t43nV-00000001dgI-3QZE;
	Thu, 24 Oct 2024 19:47:05 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t43gV-00000001bhT-0qkx
	for ath11k@lists.infradead.org;
	Thu, 24 Oct 2024 19:39:52 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fb599aac99so13986851fa.1
        for <ath11k@lists.infradead.org>; Thu, 24 Oct 2024 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729798789; x=1730403589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=odUCZ6i3Z9JVAJZgtcokijO9ujjlw7b3NCqdho3UKJk=;
        b=xzyBrlo/t/CeCih041V6yv/eBAin9//oO7jAIX15BLleptkiFqsuGijfInZwbuHWd2
         fx8YwNvjAqnZPehn3nHdQbtWoegpI4wLHyX5KF3lYMa/7pplLsUH6INXb4lZX9Izf01+
         ZCLCKxsfVDqAWNGxAkBQGMDBRPSX/pQyW0tT6SavgvgBOIsB2gHXR+MPjXqSB1GMotxD
         5GzOlKB2I+6DFtFp743I7mQQAAeILxcR0RR+aWZsI/A8jy9aCyVOD0o9otZ3VLjRUBXZ
         gt1fMZFZEqfkjnireVjlOYLdnqOECUC0IeV2S1BtNkcl6VqwECDjC0dhRpdFHfdzJpMK
         euPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729798789; x=1730403589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odUCZ6i3Z9JVAJZgtcokijO9ujjlw7b3NCqdho3UKJk=;
        b=qr8fF9ho0gfcf3vIpjDPI2dJHGM2NV8QTvXSwSIWeg0qcsMj6G1E/I5f01k5HNTggL
         L15NmHw/T8SBcJ0VW3RnKUBEkFNj6d9CkXv9g2MgaRfQd2GBJI7OnUZ0etdYSYYzBwuX
         76AbPb6cEFouIdgfRdrIu840cMnpaUi4IqxDYymuClpo6ZGEwXzhTKhLhYonTklG6mMr
         ubs0TxKnj7u57I7fDvW9fYSE669QJqDFFqUE6YatuzSV6ALJhvVcvHL4scke9BTojZhN
         rKskppxdIjs0l48UpRj+8qhouaRMTfk2ZqkYtjCREyuzr0/HbRzaIto9qhZ8XbWSs4V5
         EFgg==
X-Forwarded-Encrypted: i=1; AJvYcCWpbfPIlgjH0Y6d35I3EUOdH8Wkos3vAY0HJ/Z+8NFgz3G9ABkgGrXXTtjVPjzk0Fu9xFVLUjU=@lists.infradead.org
X-Gm-Message-State: AOJu0YywVoJdC4KYMOmgAV8O4tYw/NQRwg35ycniCy/5wryD910ip/hu
	ymJNFJA9ACY4un69xJiTnAHFzTfmeLLlri7Fz9VK1FMibWrfI2hUITkj2YesTJnqSwx/iBbhwrb
	P
X-Google-Smtp-Source: AGHT+IHIulvo8rdeRwX4wcEo4Hy4+qR8jVUvlgiU74rNHovMaurcP6k/nUFgntCcOTVditUUe1/7GA==
X-Received: by 2002:a2e:4a12:0:b0:2fb:7f9f:7f50 with SMTP id 38308e7fff4ca-2fc9d330671mr32005781fa.13.1729798788920;
        Thu, 24 Oct 2024 12:39:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad608e2sm15086261fa.32.2024.10.24.12.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:39:47 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:39:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
Message-ID: <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
 <20241024002514.92290-3-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024002514.92290-3-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_123951_291301_62A512D2 
X-CRM114-Status: GOOD (  24.66  )
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

On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
> QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
> IPA, thermal, RAM size and etc, so new firmware files used. This change
> allows board DT files to override the subdir of the firmware directory
> used to lookup the amss.bin and m3.bin.

I have slight concerns regarding the _board_ DT files overriding the
subdir. This opens a can of worms, allowing per-board firmware sets,
which (as far as I understand) is far from being what driver maintainers
would like to see. This was required for ath10k-snoc devices, since
firmware for those platforms is signed by the vendor keys and it is
limited to a particular SoC or SoC family. For ath11k-pci there is no
such limitation.

Would it be possible to use PCI subvendor / subdev to identify affected
cards? PCI Revision? Any other way to identify the device?  Please
provide lspci -nnvv for the affected device kind. Is there a way to
identify the RF part somehow?

Could you possibly clarify, how this situation is handled in Windows
world?

> 
> For example:
> 
> - ath11k/WCN6855/hw2.1/amss.bin,
>   ath11k/WCN6855/hw2.1/m3.bin: main firmware files, used by default
> 
> - ath11k/WCN6855/hw2.1/qca6698aq/amss.bin,
>   ath11k/WCN6855/hw2.1/qca6698aq/m3.bin

This approach looks good to me, thank you.

> 
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 16 ++++++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h | 11 +++--------
>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index be67382c00f6..775e48551522 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1178,6 +1178,22 @@ static int ath11k_core_create_chip_id_board_name(struct ath11k_base *ab, char *n
>  					       ATH11K_BDF_NAME_CHIP_ID);
>  }
>  
> +void ath11k_core_create_firmware_path(struct ath11k_base *ab,
> +				      const char *filename,
> +				      void *buf, size_t buf_len)
> +{	const char *board_name = NULL;
> +
> +	of_property_read_string(ab->dev->of_node, "firmware-name", &board_name);

soc_name rather than board_name, please. Or just fw_name.

> +
> +	if (board_name)
> +		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,
> +			 ab->hw_params.fw.dir, board_name, filename);
> +	else
> +		snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
> +			 ab->hw_params.fw.dir, filename);
> +}
> +EXPORT_SYMBOL(ath11k_core_create_firmware_path);
> +
>  const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
>  						    const char *file)
>  {
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 09c37e19a168..ce4102cfed4d 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -1249,6 +1249,9 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
>  
>  const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
>  						    const char *filename);
> +void ath11k_core_create_firmware_path(struct ath11k_base *ab,
> +				      const char *filename,
> +				      void *buf, size_t buf_len);
>  
>  static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
>  {
> @@ -1295,14 +1298,6 @@ static inline struct ath11k *ath11k_ab_to_ar(struct ath11k_base *ab,
>  	return ab->pdevs[ath11k_hw_mac_id_to_pdev_id(&ab->hw_params, mac_id)].ar;
>  }
>  
> -static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
> -						    const char *filename,
> -						    void *buf, size_t buf_len)
> -{
> -	snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
> -		 ab->hw_params.fw.dir, filename);

It could have perfectly lived here. Is there any reason to move the
function?

> -}
> -
>  static inline const char *ath11k_bus_str(enum ath11k_bus bus)
>  {
>  	switch (bus) {
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

