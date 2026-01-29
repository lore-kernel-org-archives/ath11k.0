Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7A4D46C16
	for <ath11k@archiver.kernel.org>; Thu, 29 Jan 2026 02:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN0ljm0UxseEJ8lxTe+BPg2+8A7FrzpNpVLKHWDnams=; b=qWrFRj3cgAQLCPLKHxrDFB4LSa
	2bckWIFQAGxjN/W+QJ+TE5nA+QQ7Nsw05x3dLSMdUN2xmgyYS1FuaAyQpuCLDiqQk51fzBt9a4hl1
	V13JwwQE1dDqg02lgZR+8XW1QVq6S/5b3chfNyXmr3Lo6FwQ61IZOCqLM09xaKpmAMiklcUZ9E5db
	oG9+e1sOeHv44nOY0bp3wlxGQnDlcEWkpc9slSAngvktUTieyKtg9s+aYr3VGp4C9NsXIiGZKx1aq
	sUEYFyx5whQ1qw48rpR1XTlsOFDTuS/cvqe5YbazGTL5+mR2aJ76rT1PzOJrmkeFROO4i8s1QHrww
	iidNzg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHUN-0000000H6eT-45aU;
	Thu, 29 Jan 2026 02:10:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHUK-0000000H6e6-2I4J
	for ath11k@lists.infradead.org;
	Thu, 29 Jan 2026 02:10:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH7jFh1129665
	for <ath11k@lists.infradead.org>; Thu, 29 Jan 2026 02:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rN0ljm0UxseEJ8lxTe+BPg2+8A7FrzpNpVLKHWDnams=; b=VM1iV3hvP5MUwM8m
	LXAGjnJUORzO++eU2bRp5jsETAZvlGwpH8KFpaXyNunU6pOHJaix0uhqBEXo6WDX
	3jDx1L4e+O9MqN1PIpR+nBLVdUrarXS+cm76UT6dr/IV52npxVAgrEQelU9eMCxK
	cnzcn9tYTjjOJ078DyOTeezrH+x+FDhZkkCOX5APd/OKSlFBRwdIGgXxRXjeMfkc
	MlSj30pv3xcV7J57fWWe7AJ9KbBow1JuYpfsZxwVxn0KBBn3+IZ2yHcyw69nZqIk
	LWMVmDcJzOeoajb4lLc0ob03gPZNb37XwXvdo6wY8zIJdnlA0buUOdi8oyyORKLW
	aTeKTQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypk21g94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 29 Jan 2026 02:10:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so416516b3a.1
        for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 18:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769652626; x=1770257426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rN0ljm0UxseEJ8lxTe+BPg2+8A7FrzpNpVLKHWDnams=;
        b=isQ0KMTJaokQyukdhyZqWG+f6MSZaD9pRdk0tHbPZWpLUk9o5yWxgWK1UY8Cv8sSHL
         sRuVfPIWRhMUmUAFeCOCEdovKgicKPWV8W818l39X1ryHr/La3400aRgb55xQxGMngqy
         fvy0yHz5Un+QSikfvhLkdiVuteYTm0eZMgn2oCpb1muqtVNKPm+xpmYGGuNi2uORfIwo
         zeaH2o4/2oZpJ0cHTsOtZMc1oh6pbaFsqswiJ9uljbD5NjRTmQTFqtgzeTxAgwfBF815
         jdBS4bvg4N7gCa7KlltSY9EFKbXNAMU4Xtibb8qqd55vPHpIVHLGWMm9ZJxuYlHZU3g/
         KauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769652626; x=1770257426;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN0ljm0UxseEJ8lxTe+BPg2+8A7FrzpNpVLKHWDnams=;
        b=n68F7ZKBqVV8AF2vRpH7PKalP4Cc1JBSLd3NIXlEDgJLcMJK32WOa8z2MF4Vc7ydS8
         pez1SOT9qLnV8s/BY1IdfVYDVOcNeYO/247yz0cdIsG4DMJTb6oZhnOlnDEFFC25zZna
         lp6JSpzKgA2DYBCwvQ/403PlxOrdkkNnA/TIkrshvejaYjxwytZ1uwwexYnlF1ZCMZ5U
         2pt+Ej3cJxJQjsxNT1uEHv5UFMfpllLxiTkEPtzC5xYQsUpP7dDLIfPHPTo8pbDgOckk
         9aum3b0zm5LaLpopBf48lDfEEz1pILGcxU04R8/cW8Efp2sU/pSuQ51nVQGt8pbs/cC1
         BbNQ==
X-Gm-Message-State: AOJu0Yy5jFCZDNSZCWp3YLKDEafOhi1l7WHNaceU9TIMxFvmLC+X3CSE
	Wbs4ZczM+t6yvJwWcl2RhHi46wzXcsg/tmslK3KsibsTDxF8c45+QeeocYgfhH6mUbSD1r4sF+f
	1WRduy5XMJ535XNkO1Kj07n31mLy/W/QJaWwzmj5QZchdqjBIj55U7voZ4KyWUNJN
X-Gm-Gg: AZuq6aIn8bZmBXoBad+M78yLAvelw/uOI+rqqLVWYmd1a7JhRN2hPjezADqtaVT9H5F
	Ezu/53sgAaheEuSmbNXXuW1bhyOhJ2gRQ3VJA55VSpQICImy97Do/CB3zrrSAEVWhnIV8zvwO/w
	nMW7FfuKBNJAU1rCR7mYSA/QXlBUex8vL0O4RoBPXnTcVqDEkzu0yigImgyoYSpBR1Mxpy0SCi6
	TtRoLL+RzLwmM+wVfuYS9RlOeU0DI6yAPLWNU3wQ5D67DtUlC0CpELu7YSMvJBN2OrxmqVXSIRf
	oimL4WxHwIXeutM+VVO/djCILbp6o1CxDzGITmSassZzV821Ys04FiPh6CndSV5IGpSe0+kINYM
	CI+SD7JP3AJrJnd5MvtYIogTNLqQaSCesTKmuWHTCPR67RwxW1sdcHTKJqSIk2LcDVczs7XN+eI
	7sBpiwJf8=
X-Received: by 2002:a05:6a00:2d0c:b0:81f:9f41:34bb with SMTP id d2e1a72fcca58-823692cf1eamr6317508b3a.56.1769652626431;
        Wed, 28 Jan 2026 18:10:26 -0800 (PST)
X-Received: by 2002:a05:6a00:2d0c:b0:81f:9f41:34bb with SMTP id d2e1a72fcca58-823692cf1eamr6317482b3a.56.1769652625885;
        Wed, 28 Jan 2026 18:10:25 -0800 (PST)
Received: from [10.133.33.202] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6b277sm4347222b3a.29.2026.01.28.18.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 18:10:25 -0800 (PST)
Message-ID: <81626c5b-f45f-49f9-9de5-5e6c65455b27@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:10:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 ath-current 1/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com, krzk@kernel.org
References: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
 <20260121095055.3683957-2-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260121095055.3683957-2-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PfvyRyhd c=1 sm=1 tr=0 ts=697ac193 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kmMDWrLNbHBTTpzL4qIA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: uCkT_tWXGqDi28QcaNmz8uF4R_KmJIF5
X-Proofpoint-ORIG-GUID: uCkT_tWXGqDi28QcaNmz8uF4R_KmJIF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAxNCBTYWx0ZWRfXw94Hfy0xOxah
 MesF4MPveMGw8Fiw4zB2u/G89PvLD4ozrRqM1qhg936sL/B7CqVLpzEDcmwVggA2bzdNQ6sg5KY
 SSaJc7pfr3PDe2RNbyRleV4T0vYPpjiZIbdoAxskaPpkFMDspwT8FOvOKwud/HFVuv8xqFUemgI
 YU7i6F7tycgJ+jhdskq3dHbe5S7dur4U6N0kuNnGYRzwtmQYrLJVLeP7swtkiq9JNbYLn7urvJb
 1SYfsENzL6aaI2SoKcmHFSmU1uxY7Et/BwWJ2mUxvmawsItVNamsGoKDOptQR7CAPGXbKp3y2Rm
 VT464hcrltyhleRpTHvpmjcf45YauV63quS0ftS9gxyMQ11QpExKNBP/bn0hBwXD3M7uSLwOUaY
 0ZkvP2a85SCqESpIO8Y0K3hL0MGXhWOAk0oNn7BMxY7ht39hb7ZaSkm2x4KkKa3A4BfSJ3maSI7
 y2Y5mgjDnutn314Nv6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_181028_612850_48A2D08C 
X-CRM114-Status: GOOD (  20.30  )
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



On 1/21/2026 5:50 PM, Miaoqing Pan wrote:
> For M.2 WLAN chips, there is no suitable DTS node to specify the
> firmware-name property. In addition, assigning firmware for the
> M.2 PCIe interface causes chips that do not use usecase specific
> firmware to fail. Therefore, abandoning the approach of specifying
> firmware in DTS. As an alternative, propose a static lookup table
> mapping device compatible to firmware names. Currently, only WCN6855
> HW2.1 requires this.
> 
> However, support for the firmware-name property is retained to keep
> the ABI backwards compatible.
> 
> For details on usecase specific firmware, see:
> https://lore.kernel.org/all/20250522013444.1301330-3-miaoqing.pan@oss.qualcomm.com/.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Fixes: edbbc647c4f3 ("wifi: ath11k: support usercase-specific firmware overrides")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 27 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h |  4 ++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index de84906d1b27..3f6f4db5b7ee 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1044,6 +1044,33 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
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
> +	const struct __ath11k_core_usecase_firmware_table *entry = NULL;
> +
> +	entry = ath11k_core_usecase_firmware_table;
> +	while (entry->compatible) {
> +		if (ab->hw_rev == entry->hw_rev &&
> +		    of_machine_is_compatible(entry->compatible))
> +			return entry->firmware_name;
> +		entry++;
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
> index 3f41e6569a78..a0d725923ef2 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -1292,6 +1292,7 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
>  
>  const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
>  						    const char *filename);
> +const char *ath11k_core_get_usecase_firmware(struct ath11k_base *ab);
>  
>  static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
>  {
> @@ -1346,6 +1347,9 @@ static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
>  
>  	of_property_read_string(ab->dev->of_node, "firmware-name", &fw_name);
>  
> +	if (!fw_name)
> +		fw_name = ath11k_core_get_usecase_firmware(ab);
> +
>  	if (fw_name && strncmp(filename, "board", 5))
>  		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,
>  			 ab->hw_params.fw.dir, fw_name, filename);

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


