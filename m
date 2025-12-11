Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A55ED3E784
	for <ath11k@archiver.kernel.org>; Thu, 11 Dec 2025 01:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GN++ADGzM627PAx9EVYDzZ1p5toEqhe0ETwpTHidCps=; b=ADqNPunYY4fVpDRhGIl9xUPhzI
	/5MPg5ZJzdXcdUVSpC2I/CJ/dLAJhN+ihrrTRgAQzpYcU8k0Oo1TNavV0PjBdMEMsKFLaXRxTQeWV
	tC6BO7A11zA9oBF6rnGbVmX1KLS/pvNC+MxsD2zafGOXaHDSXF+X8nDrcPxtOwZ0Aj86T7+o9VQda
	Ad7QJqoBxf+3w5o1ygNgLUNuq3N/TtOGVDgKWY2YRmxvLxm2yoEpPw3Kr5TvK368dkbFqfxFXqmD5
	Eq0l8lkZvlEMuDaxXFjdU/erSUe9bVFlFbdMyhMgcYjrLj2meStt+b/J67wWiSW55NoDwvBlP4EnZ
	v/D1Gbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVdr-0000000G5dC-2adO;
	Thu, 11 Dec 2025 01:38:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVdo-0000000G5cm-2joA
	for ath11k@lists.infradead.org;
	Thu, 11 Dec 2025 01:38:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP5PU3889559
	for <ath11k@lists.infradead.org>; Thu, 11 Dec 2025 01:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GN++ADGzM627PAx9EVYDzZ1p5toEqhe0ETwpTHidCps=; b=PL9mXFQpWSUJNrgp
	WmBsV68Ph1mf7McN5yeMpTjJmp0LNEqi+fqIMpoEAenx3+ue6YcfVZbEqzvRpUHq
	mlFZAqwH23+R0ZnKw8i2YIIUYyRxg0dVYWykkA10z+NRTO5TbUWRd3YPhbeXkr1r
	jhIDnBLgHKTX9fuT8yIISnPoymO8hjEbUdmRH8zYckWZBopd9GKfwqUpLn+cE0iU
	aZCD5nk950X1xsGlZm0HY/yclNtM0CBuYQcVbnO86wbXlFJ8HeNAwjp2Z61Csid9
	KW+1tR8Sfb3QZbxqNcZyj2EIrvotEzaqajhtOPM/LnvJrjLjLO8oVcFZh3dwNH1n
	HWeZgQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay5tx2tss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 11 Dec 2025 01:38:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f046e16d50so698480b3a.3
        for <ath11k@lists.infradead.org>; Wed, 10 Dec 2025 17:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765417126; x=1766021926; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GN++ADGzM627PAx9EVYDzZ1p5toEqhe0ETwpTHidCps=;
        b=FC0t2yy5X1UxKg6fc8xOyrn5H0hp+k5C+5LQid5b8vxyouaMNWob3iJOVwnOsRh4e9
         JhdRi7cIUzje3dj74GOZfrTjWHZcsAUn+qqGaJ1U3ccc/NpUYEVeohf6c+a8+Ke9vXjN
         FsuOt7u4Rxdu4+p+5ioas9uOyqo370a5LS+DrXDPua4cWDj14NU647eyP23ymOubt02G
         wA/EQJqOxaz9R9NBho2Qf5k0NG5Ly3bpW0A1c7KchRy779RtmHkBlNFWycwCFKyk1OpT
         Lb6PXT/bc0P4wbl9YSnV9XNk7fBbJC4VJ0hFiOVWNx7cRQ/98bVE12t/mPNznUM5ou/y
         0Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417126; x=1766021926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN++ADGzM627PAx9EVYDzZ1p5toEqhe0ETwpTHidCps=;
        b=KMWvgICBxEmHV0EEgRUGTKjQKa3lzkaA26Zkgrk+g8jaTrGlIdVaLlk9t5IjaoA39k
         hEm1ktvCMpUmCr+TSEUFn64pudz6UvnbcCAxlfQlss67y8UVabedwmi3r9h7wfvJV7Y1
         PSQ3z0gq+Q5gnHO8f2k/9xZfGXEX1c/He7Klh/ynz+1zkETC8RB2w6WDahRTrCgZS2UR
         poGkEwwXmuuGUCV5YCNoR5EiEMfYiNVQCIgJojWukSdQaOzoUtbOlS6ee8YCftW8mSyv
         PFtI3cTQTPS7JRBW+jMnygO2MpZIOgoA0na3NcKUpjy8k9NGjUb7s2uEPF1of+QKg77A
         3HRA==
X-Gm-Message-State: AOJu0YybUrBcYA2dR8WM9VMksRa6Im51ufXJu2XqyyyVL7fstO+MWUsb
	WlJg8ztDHQ0EnZmq047QRQfBzOAo1JcS1+2OGFup4CPI1c8b1a0DvpyTBrhTBApVOnQm1YhE8K7
	wzu0AHorfKmV6qVLnosMO2BSUedc+5CaYBsrIZYyukOSgaRDy5zhZuyvhD3LlTZur
X-Gm-Gg: AY/fxX62AiQqvCB4AaQxzwFdzNFB+kYQZZnCDaycdGaLTzo4R4h0htrr5PhEecMyFMU
	FlvGfDAoB2YlDiIAB7SbtJsX8TDf9MBB+6uhMRi6DqKIWxlZtOeuQ6edEEHxz0yPeJCSStRRjdH
	0zXrnir71ComrpoOTc7f3KR82de5V4HvR2iW3WiNgeipipgbrGRyNAiiYqkLXPqLcz5f41uAUuq
	/nJol99A3Fbyvp8D4TV68/xL3WBbrrCxMFjvrnO3mr2OPtKTpSIqUDlLPIuoGndxqLdEE09z/Ai
	EwPd+FnxG73Bn02J2GdvRjlyM8cFGsp+fZwZ33D+FQm2ZMQ3AOEJWONSVypEReHKwg01Dcl8vBT
	qOtCj8KVVUaar0rNxUak0izYy9S8P5YLC+NHjihVgfYHz41cfkmckfI4oCYE3X4AI/y+y3YQT9n
	g0U+dbkpE=
X-Received: by 2002:a05:6a00:198d:b0:7e8:4433:8fb2 with SMTP id d2e1a72fcca58-7f2301c1149mr4259211b3a.58.1765417126244;
        Wed, 10 Dec 2025 17:38:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENC8HecPgiesBQXDwASJPfBe30YPLdltG2S8NA3lisGTdaJnNZvdAyMo1l59vYSLD75Dcyyw==
X-Received: by 2002:a05:6a00:198d:b0:7e8:4433:8fb2 with SMTP id d2e1a72fcca58-7f2301c1149mr4259191b3a.58.1765417125751;
        Wed, 10 Dec 2025 17:38:45 -0800 (PST)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093a56sm709545b3a.47.2025.12.10.17.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 17:38:45 -0800 (PST)
Message-ID: <af4e1f59-afa8-45ce-ba6f-5800dbfa9486@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 09:38:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 1/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
 <20251204071100.970518-2-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251204071100.970518-2-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UmGxZvzUWOkGLl3_9JBaAGJraZEDMHf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAwOSBTYWx0ZWRfX9aV3IkRrfjSa
 2M9ioPafmcPbbGv2WyjKzXxxexTQuG1cOdhgg2+oxWqMZal/1WsLCmXyMYrhoZQvvVz1t4xl7d7
 mnp7MinqHKEiSF9/nWdMB7YHciGAGiE5KHGTz/1mGQ1v/O2PfN3FPlFhR2f8cw7opozG3ZOzTzc
 43kMQMaNxsEQeT/aaoGTErbfkPphoXMR4A117cDLmxQzA7WYVJqpu/ZbTwgkE3iTC0uCcsxCvPR
 /0I5/uSJ+uSj5zLl+P9NeeBCZjwKiw3g0CTkBFhT7Hxw47Twe4mc40cVO5rBB5oY5fvkPYovs72
 5XK3tZTsbStsErY12z/TKtSebqOXnqa8FXfjCNBQbvpHU2f2+R6ViC5eLCvbyhcbOxR2Fpm7l5T
 tjT4HK4LCYyExsQ4kVTvOvg4rZiLrQ==
X-Authority-Analysis: v=2.4 cv=dq7Wylg4 c=1 sm=1 tr=0 ts=693a20a7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qPzGLdPRDFbHXEUNeP8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: UmGxZvzUWOkGLl3_9JBaAGJraZEDMHf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_173848_842555_16E34B8B 
X-CRM114-Status: GOOD (  23.91  )
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



On 12/4/2025 3:10 PM, Miaoqing Pan wrote:
> For M.2 WLAN chips, there is no suitable DTS node to specify the
> firmware-name property. In addition, assigning firmware for the
> M.2 PCIe interface causes chips that do not use usecase specific
> firmware to fail. Therefore, abandoning the approach of specifying
> firmware in DTS. As an alternative, propose a static lookup table
> mapping device compatible to firmware names. Currently, only WCN6855
> HW2.1 requires this.
> 
> For details on usecase specific firmware, see:
> https://lore.kernel.org/all/20250522013444.1301330-3-miaoqing.pan@oss.qualcomm.com/.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Fixes: edbbc647c4f3 ("wifi: ath11k: support usercase-specific firmware overrides")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 37 +++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath11k/core.h |  7 +++--
>  2 files changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 812686173ac8..a4a3a65c7752 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1,7 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> @@ -997,6 +996,42 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>  	{}
>  };
>  
> +static const struct __ath11k_core_usecase_firmware_table {
> +	u32 hw_rev;
> +	const char *compatible;
> +	const char *firmware_name;
> +} ath11k_core_usecase_firmware_table[] = {
> +	{ ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
> +	{ ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},
> +	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
> +	{ /* Sentinel */ }
> +};
> +
> +const char *ath11k_core_get_usecase_firmware(struct ath11k_base *ab)
> +{
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +	const struct __ath11k_core_usecase_firmware_table *entry = NULL;
> +	int i, count = of_property_count_strings(root, "compatible");
> +	const char *compatible = NULL;
> +
> +	for (i = 0; i < count; i++) {
> +		if (of_property_read_string_index(root, "compatible", i,
> +						  &compatible) < 0)
> +			continue;
> +
> +		entry = ath11k_core_usecase_firmware_table;
> +		while (entry->compatible) {
> +			if (ab->hw_rev == entry->hw_rev &&
> +			    !strcmp(entry->compatible, compatible))
> +				return entry->firmware_name;
> +			entry++;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(ath11k_core_get_usecase_firmware);
> +
>  void ath11k_fw_stats_pdevs_free(struct list_head *head)
>  {
>  	struct ath11k_fw_stats_pdev *i, *tmp;
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index e8780b05ce11..f8fcd897ebd2 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #ifndef ATH11K_CORE_H
> @@ -1275,6 +1275,7 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
>  
>  const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
>  						    const char *filename);
> +const char *ath11k_core_get_usecase_firmware(struct ath11k_base *ab);
>  
>  static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
>  {
> @@ -1325,9 +1326,7 @@ static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
>  						    const char *filename,
>  						    void *buf, size_t buf_len)
>  {
> -	const char *fw_name = NULL;
> -
> -	of_property_read_string(ab->dev->of_node, "firmware-name", &fw_name);
> +	const char *fw_name = ath11k_core_get_usecase_firmware(ab);
>  
>  	if (fw_name && strncmp(filename, "board", 5))
>  		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



