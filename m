Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E10FF885A
	for <ath11k@archiver.kernel.org>; Tue, 28 Apr 2026 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=; b=U1/eiPS1Ufjq0IwXk8oOJTg+bR
	0uAQgya6xSZsiaiSgvSlHfeCsGW27W4qlDthANDrMOQl+ASUZtWnl69L6SehEtGoEVxHsyIHzBMIl
	QPphDZrGulHu+0xXMuvDEkJWtApwZyKjIgPl+r7v3Xy0r9GbK+wgkPnN85WWTiJfK2hLMzvXMuqNn
	7h9Og5cFcs3BCeOCfJQ0Bq+N8qW74RuXeV3E8LnFghrYhxgQZr8RsTCqSJxZ+BVxeExoNiB70jG7+
	c/H0Gh1EKRi1botSLrucyiByhNsUVjyMOEu7EG2EngT+X+mI44ewTnKffPs2ggn1zabURcJu1kVt0
	m/uhXLpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlaw-00000001yL1-1Z31;
	Tue, 28 Apr 2026 16:47:34 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlat-00000001yJt-0KBq
	for ath11k@lists.infradead.org;
	Tue, 28 Apr 2026 16:47:32 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-415c8a4d2e6so4616825fac.0
        for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777394849; x=1777999649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=;
        b=QC5Qqro4mFCY1roEi2lY2Kgaup1GRLngLXzhRrvPz7Gemf45QQiApRchtV6lmDhjJe
         B6UM+RhyIKlkH/FDZ0MlAy4YScZ/u5XJlD3sfMhk6oDMP1jhJVvcl4cTJpJrSpXOuNGy
         ICcclbL0iA4uBMBePFlSrKwI0fxCIrvj57FVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394849; x=1777999649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=;
        b=XpOigOAn7cAPgEwlnxUZhUMtZ7NOa6Lt8MXFsaeSFNHvVwFA1hgMUwNbSDLVLxh2BP
         DrD/jqdmabkow8fkmGlBSioZFlgwLAgoiMRviol8TfImjVFUJ88wtLDCoT6ZmiXavo9y
         pJ1l5Weewb7EGpQx2KYMi9uq3xuaxTtqgevqzIyK+5IfAWtB9MXKvR3Uiw7FRKk7Vmjx
         hYbkPYVl3OdNU9UpolnuybSw5q4ZSZgEXfVH4sBLo3SwKcJoL6nG3+bxkhL/0/dhBDBX
         TkfGGfgWGH1TmGLiKVIsqV3rVibkJWO12OUMRrciBtOqM8ebI+HoIrKeh+Z0uVp0iWjb
         fitg==
X-Forwarded-Encrypted: i=1; AFNElJ9fZSTe6mq/90JhQiUroa1bwPTJRdeADYK6+kBkLQOcJAW6F+wyhRU/KJBnc1GUfZdbkwMrlXc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvUaAEUYL6lmV73D3onE8G9lXZWQ1r0ozQZgNipIkdIaWookJ0
	Glgcb42tXhqmT3pwTiR0ZmksmuGQVk11V620WGD4NgQNTUfjXcMxgQLU5LVRSkWnAA==
X-Gm-Gg: AeBDiesbtOLmmxfRnj+cD74LSoav7BcFiv7kWlgvCw0EqNtd35RpFHZyPugCnCCGi0S
	ng5nzNNV+HdoTTgRf27S2K3C7jYzIil8jUiEmb/l3CzDJlzcZOCfRcVu/+8fvIiyoFCbkjIEBX3
	0C7mPejArE+Rv+AbMb3XX3w2ZAPYLF4BMATCVBRlpJCr3I/D/LPX3qMBnVFplPDkx+5KTMM6FEg
	awm+mVw9UxNr84AAuWdeFZaYgCi/lt2UwSExIY9lgcEyKA4ZGo/m2T4YZ83MXDyG5qxXueJvArP
	FsCkElFO8pN9Iccwnawq8YzILwQ3Qo6fSjR4OjGs9OXPWfKtOp8IHdHLOQGW+LbhPfeOLLzT4DU
	S3xTATGACGdN3jgs9U6HGc07Ou3HkI4I0OmKSyqzGWSQ2S8GGZeJZ44UlgOEqUdRC/daPpDMU+l
	Q0Pmas8N/W025orv24maSPPHHZMIYswuxd2uxOCNJztRyRcmHF8onVVXMwbeApv1fW0tXG
X-Received: by 2002:a05:6871:e78f:b0:42f:ba47:36f5 with SMTP id 586e51a60fabf-433f396963emr2135147fac.17.1777394849189;
        Tue, 28 Apr 2026 09:47:29 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-433efbf1d8dsm2255892fac.6.2026.04.28.09.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:47:28 -0700 (PDT)
Message-ID: <bf380b65-1513-4792-9e3c-d03bff17c141@ieee.org>
Date: Tue, 28 Apr 2026 11:47:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
 andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_094731_230992_E28A0BDC 
X-CRM114-Status: GOOD (  16.42  )
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

On 3/16/26 12:14 PM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Looks good!

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_qmi.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
> index d771f3a71f94..37936ad132a2 100644
> --- a/drivers/net/ipa/ipa_qmi.c
> +++ b/drivers/net/ipa/ipa_qmi.c
> @@ -66,11 +66,9 @@
>    *   determination of when things are "ready"
>    */
>   
> -#define IPA_HOST_SERVICE_SVC_ID		0x31
>   #define IPA_HOST_SVC_VERS		1
>   #define IPA_HOST_SERVICE_INS_ID		1
>   
> -#define IPA_MODEM_SERVICE_SVC_ID	0x31
>   #define IPA_MODEM_SERVICE_INS_ID	2
>   #define IPA_MODEM_SVC_VERS		1
>   
> @@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	if (ret)
>   		return ret;
>   
> -	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
> +	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
>   			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
>   	if (ret)
>   		goto err_server_handle_release;
> @@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	/* We need this ready before the service lookup is added */
>   	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
>   
> -	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
> +	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
>   			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
>   	if (ret)
>   		goto err_client_handle_release;


