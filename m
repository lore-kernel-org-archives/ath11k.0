Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069BDC36000
	for <ath11k@archiver.kernel.org>; Fri, 21 Mar 2025 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d5DvgyokFiqCNcz1zJsWxkP1xiNt8Du6XvPWTVYw2Y=; b=nWFjOmVzBrn3+1yjcOz3mfYJNo
	zxnup0hRkKIAjuxfgQcO6pJbqeKo1dwIgUot3xH2ic20LI1NOzUYDeECm9m+4HVMkY7iTG/UOirrN
	DET+7RZrpKHSw7lhdufnUqNzKm10G6pw7K7Ay+zctHLldDmEjyqBRAus01rARJp5GR+yuh3Yi+vaQ
	IStZv/IT/BMEYCHNNOJNFFp6/mRaTxsXIeEHpK9ocJnvR9yoy6qZEVA2jiT2xtd3JDIzMPV07wVDZ
	b4GQOgHuh7abtI6Ygw3GwjcZCNbfO4SWKSo2TDuz+OQ7uzE2rCZVHzDYoEd+doH01S2o9tgLcpQAh
	9r5xhq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfAW-0000000FUdH-1Us2;
	Fri, 21 Mar 2025 16:24:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfAT-0000000FUbi-3Lpq
	for ath11k@lists.infradead.org;
	Fri, 21 Mar 2025 16:24:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATLht012847
	for <ath11k@lists.infradead.org>; Fri, 21 Mar 2025 16:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5DvgyokFiqCNcz1zJsWxkP1xiNt8Du6XvPWTVYw2Y=; b=oasAynND7/YT+HYf
	2j88kbkZD99S7pb/fSWAoJdNltOkoY3o9Vf8tdq8wz3rbw3NzvlXkqg3O0IqAAJK
	CYtra/zzAPDlPRW4wg4tmWh4gDuTrOg+i01gU/uxMnXk6lWNCp7nPqVC5NpAte6G
	7+sInkduiKlSdpNO8nR7JoB/JazI1UJSCgQxRZZwSfFLZ5KNXVINnQvVVVro9vLA
	TpvqoF/mGmArbQ3GsFE+LQ5gq8Ng7pb+M7xdMIjqWVBJ+ez+W7gNBwBsjjfWEVOL
	cz8HJIdsbo1c3vXKef5wlHd1p58FAOy5scoonPBLWGYsU5cbggZLQMReVyji9sqO
	oh5qIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t46frf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 21 Mar 2025 16:24:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ade807fso57448895ad.2
        for <ath11k@lists.infradead.org>; Fri, 21 Mar 2025 09:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574260; x=1743179060;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2d5DvgyokFiqCNcz1zJsWxkP1xiNt8Du6XvPWTVYw2Y=;
        b=wvGriVz9T0pmoq77a/0NTNyBjaNINKCkZTk9JoC8OIO65GKp/dPj9/9GgoOiRTwuNN
         UGv3NMwL2gUzR+ezRXE+xd6Rb3D7VcHYT1Oow4NmJv1GTXOHWfSvzLCO+KqAi+jXnA17
         gxab5L5QozwRksSzE2QhXna3YVRAvnU/P3Bi/qsUOHS50DqwVIa/UFFBtyss6iOoQOvr
         KTamNxo3yCgyZFQluf+MYX+fy8x/Nvc8Qfb/Oa6e8aUye4L62o4Dqe5zwDs3EmeijEIV
         FuAezX+5H+bpUW56yCmz//PXEFiGlgQr6CFfjarzsREP52tZ4oewwtVRZXmWUfl2LRrS
         0NNA==
X-Forwarded-Encrypted: i=1; AJvYcCWoGHRa49vYFjrX011Q55C5qG+9UVrm97WJtWM/YeKUMuMsNTi3vTAhMAdI+VFWB4oB3tgKfAo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXj8yR/XEUxouvzEIvL2BM6+tL66vdyRZeZfMkRidmb+yOW+em
	DT73kngOwYFprmcTXo3l+ts7eAxlhLa62KDAbYxLboHl8ZebY+j+XpoXhiWBGexKgtMlK7CTUnJ
	NDtDxNKcjiVGHa04cT5RdRXbwx3vtai20O9vDZwEzit3I3BJ1oUQXkCZZBxD7SL0xlUw1
X-Gm-Gg: ASbGncv0z9uPNownSOnwat37Rojn/JopLIa/pW6Ek43l/jSX7c6UfcqKxDrY2PRwbUl
	HrIE2BEc2Hbw4Z/iI8LbaT5fbDeFkdtRmhroelnCxt6n03H96KYq7Su1HIppmvjj0WDoAoK9wYH
	lFAjv8H/s9Taq4MS1XtgLobTdPihg5Q1EmNRn0LRdiEO58Cy9K+chomPGkuRsye3fL6QRkbCGqO
	Q356jmoYJeIrbzyTGv6RavAha9nql1s42lNsUoC8W57GmQ30lfZBiHT8BVFHz3ud2IEr0P71cPp
	ul2aeKxWS4MOHq7fE65EC30Jn9MNM36MAfknXDo7PmwQ/IFpJDK+z0l0YOlpFgvyr40mByn5X0i
	V/f7nYEYr
X-Received: by 2002:a17:902:d2d1:b0:224:24d5:f20a with SMTP id d9443c01a7336-22780e231a1mr71159315ad.48.1742574259983;
        Fri, 21 Mar 2025 09:24:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt2eaavmZmR9HVJNc3FxbeTqHpXoHvG7fdrQvJYFASMN5Kh6hmiQwNOs32h5LYePkevZ6ItQ==
X-Received: by 2002:a17:902:d2d1:b0:224:24d5:f20a with SMTP id d9443c01a7336-22780e231a1mr71158845ad.48.1742574259557;
        Fri, 21 Mar 2025 09:24:19 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f651asm18842265ad.209.2025.03.21.09.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:24:19 -0700 (PDT)
Message-ID: <2fbf299a-b596-4a61-becd-07e66f7be29f@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 09:24:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/5] wifi: ath11k: determine PM policy based on
 machine model
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250320023003.65028-1-quic_bqiang@quicinc.com>
 <20250320023003.65028-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250320023003.65028-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dd92b5 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=stGd1_jjPkh5WPs-QC8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jtKw4IDBoyMSz_cmRffEuU7fnsxskWRS
X-Proofpoint-ORIG-GUID: jtKw4IDBoyMSz_cmRffEuU7fnsxskWRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503210120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_092421_850235_123D7E56 
X-CRM114-Status: GOOD (  25.14  )
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

On 3/19/2025 7:29 PM, Baochen Qiang wrote:
> To handle the Lenovo unexpected wakeup issue [1], previously we revert
> commit 166a490f59ac ("wifi: ath11k: support hibernation"). So currently
> WLAN target is put into WoWLAN mode during suspend. This is a temporary
> solution as it does not work on machines where WLAN power is cut off.
> 
> The thought here is that we do WoWLAN suspend on Lenovo machines while
> do non-WoWLAN suspend (which is done in the reverted commit) on other
> machines. This requires us to identify Lenovo machines from others.
> For that purpose, read board vendor and product name from DMI interface,
> match it against all known affected machines. If there is a match, choose
> WoWLAN suspend mode, else choose non-WoWLAN mode. Save the mode in ab
> for later reference.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 55 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h |  7 ++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 3d39ff85ba94..8657e735bf16 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -907,6 +907,52 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  	},
>  };
>  
> +static const struct dmi_system_id ath11k_pm_quirk_table[] = {
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K8"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21KA"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
> +		},
> +	},
> +	{}
> +};
> +
>  static inline struct ath11k_pdev *ath11k_core_get_single_pdev(struct ath11k_base *ab)
>  {
>  	WARN_ON(!ab->hw_params.single_pdev_only);
> @@ -2327,8 +2373,17 @@ EXPORT_SYMBOL(ath11k_core_pre_init);
>  
>  int ath11k_core_init(struct ath11k_base *ab)
>  {
> +	const struct dmi_system_id *dmi_id;
>  	int ret;
>  
> +	dmi_id = dmi_first_match(ath11k_pm_quirk_table);
> +	if (dmi_id)
> +		ab->pm_policy = (enum ath11k_pm_policy)dmi_id->driver_data;

Cast via (kernel_ulong_t) to address the kernel test robot issue

> +	else
> +		ab->pm_policy = ATH11K_PM_DEFAULT;
> +
> +	ath11k_dbg(ab, ATH11K_DBG_BOOT, "pm policy %u\n", ab->pm_policy);
> +
>  	ret = ath11k_core_soc_create(ab);
>  	if (ret) {
>  		ath11k_err(ab, "failed to create soc core: %d\n", ret);
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 1a3d0de4afde..df2b0cb2f0b5 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -892,6 +892,11 @@ struct ath11k_msi_config {
>  	u16 hw_rev;
>  };
>  
> +enum ath11k_pm_policy {
> +	ATH11K_PM_DEFAULT,
> +	ATH11K_PM_WOW,
> +};
> +
>  /* Master structure to hold the hw data which may be used in core module */
>  struct ath11k_base {
>  	enum ath11k_hw_rev hw_rev;
> @@ -1058,6 +1063,8 @@ struct ath11k_base {
>  	} testmode;
>  #endif
>  
> +	enum ath11k_pm_policy pm_policy;
> +
>  	/* must be last */
>  	u8 drv_priv[] __aligned(sizeof(void *));
>  };


