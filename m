Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50DED2ECFD
	for <ath11k@archiver.kernel.org>; Tue, 20 Jan 2026 01:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EurZDX4j1u1daRQ8YIKhVg9OpQ24kYt1o7VNKtuF/UI=; b=3ONu3lVLa6wA7lggp9+AWdzFQ2
	CalBz4TeSUehnmUqYETzcdwEsukpe1+qperxeOZoaXcAGt1PDle9dHMnZxbaGtcLkJtle/FrpOGuc
	YYr+kx5WwFu8CH3QtWY+ItkjApd507bVSIjR7BiaoHPo01cVHR9vAdbAtAML2H0E7ApemqefsobIa
	TfWfFBjhmkSQBkeGp/ur44ROP07/KA3LwiBXUb0YhAy1ETg9wWjzts50qT6ZB5QtW73ok/vazF3lj
	36p5YpX+awR83XUR6U4GxEEfIFxosPj/6SZJ8FsIUvkklI198iBwe0bn8P1DqgF3d4yZUVaMELMVa
	6v9V32+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0b9-000000032PC-2GBa;
	Tue, 20 Jan 2026 01:32:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0az-000000032O3-43Kf
	for ath11k@lists.infradead.org;
	Tue, 20 Jan 2026 01:31:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JKPDDe2344735
	for <ath11k@lists.infradead.org>; Tue, 20 Jan 2026 01:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EurZDX4j1u1daRQ8YIKhVg9OpQ24kYt1o7VNKtuF/UI=; b=RjGECdWYlwyTkN2g
	6tCN/iGciBQ9Qg5Fw/3jCruvszhgWBc1AWKXtPUc/Cit7FVvnrxiySNf6mzZ6M3v
	v+B78M17RSSq3iyf8Yc7hec9u6Im/OF742sk4TaE7TuyfxtNooOP7rW1EJNbP1Ub
	7jA7JKpCyhMyluDVsA0KBTqZa1owkEyAwXqkgSoqdWxYmUMuBYEjzt1dPOjmJC7A
	B6cdKAs7UOSRGJ3Z7ym51kV8refnS4AIakBsVzCWGH/Gh/ujfD9gN8EzCdsrKZnv
	fj4qID0njP6GdU/Q3FkZ63gxeqP151Bk0VNU8kVmodTntjEA+BfYS5UdtXXXsYr0
	H21OrQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yugc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 20 Jan 2026 01:31:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so3965861b3a.3
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 17:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768872708; x=1769477508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EurZDX4j1u1daRQ8YIKhVg9OpQ24kYt1o7VNKtuF/UI=;
        b=F0T4iEY7d+I15/+MRUhnh4D6/z72cpxNgcVk4ckwq+2+RZAA/jr9H/9WR8Q1Ng/Xqe
         wCzwHdwUQ3teKgyHFE5ZiHNSzobD+v3SbeNjHrBHw5B8E6tzafCrAyRMzA0yPPyrpSeg
         LIL25pnTdTdqOtoiSFitGqj7L8ObNDHw/Q6OOEJSAw8uuUOxqCsoAjloaEGuHAAuDkTS
         IwkPNpMpVzx19iPYCFjeuCg4KcFe0cqAhqb7lbZpwE5ogwkHajBmis0NNBS1u2oikO9s
         8ycSFt31NWLaz8A9aWfiBLSAC6Ingw8AmK4rDpqst492XMDDLoBFB1bNPnEt+LSOzzt+
         hAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768872708; x=1769477508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EurZDX4j1u1daRQ8YIKhVg9OpQ24kYt1o7VNKtuF/UI=;
        b=BeQbNUKIbdk/Vosr2j6+hKOUbjYaYiEWcDzqXKXhijRDsTIkHDMcGw8A9NKGuMaEiv
         cQRSJWZ5E0CGNWAT5fskmwo2P3rsqxX4R9CMTN+xsvLOAN4O0BJ+TLa8YBTQ1/a5uN/k
         bbHKgR8nme4acWWzX658ESR6h0jw/CyYgbfisaWQM+zlOPjPZCnfvRxa+9p1JHMXLzG2
         LZuUCtlrfHvvLP/Ou0YlNvXsr/sgpPHR0XtlzPEja/qjL6ULL2EIckUyGMEIWpWPyNxP
         /MW878KcEFH3Q8S1gpMA8aE2hpnKOb9n9HVNb60/m9+xgvMj+Vp+SNZ+nJPPfmp0SGGH
         WLbg==
X-Forwarded-Encrypted: i=1; AJvYcCXKw7ccghjUonVwZy51mwiKTyVf86h0qD43WWK/ofX+JliU6Y0NVfPWNdU9AuQhKobwllzBE+M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuj2bfNcYVrRyF6rs422Ywa32j8wXfWlJJGayZYAclHKwtfWMS
	kOMBAd8CTJT3nYOHWX8rbjirTgWUUmbI9LLnMpf1i6WjFwmA5zc7cmzIRKP0iJhmRMrpZCK+VEQ
	N9W3rduTnAbUobhScPinj0G0Qyifx5fWfsypOTIp9Ys3KII7SUI7icEa4UeJSf3cH
X-Gm-Gg: AY/fxX686eLbGkB+VUIQTdteffuaX0/8GLY0ChAaA6p7bfDZyp5rz769Rlv/Dao9PUg
	QqLfeKG2jPVzGsIZgLzyV5SiJExBF/s4lw4ikv4yl/nqAANmAIrzDbv6fNoAHYD+i8CAQJj9fOD
	zNvb4tnelGEWdsV+VzYhDSy38xVIGptmhevdrJRumFbBcpzCzM2xbDcyB4G1uqyuxC8ru85zY+C
	bvjbtKj17slY+XWYdGdsVB0d3ZW1L4H0vLUDSzrBYk9WY34xDAfq0x0k3eJXm2wm2vn7YpN4Hdw
	mRxNOejE44GvLboeTQQvCkRHpKrJRz/Nf0zA3K3Zd8LVO9gGsipybLnu6PYxSnhPLNlEanQ/ro7
	XQeGXSOMWItNX++LpDf+0EeLBNcJLLz1MnMUtVdTqrAp+Yvb/VGa9Vs9jR3mvKbdw0k7U9E4/0Q
	U7u1iX
X-Received: by 2002:a05:6a00:ac4:b0:81f:7db2:89db with SMTP id d2e1a72fcca58-81fa188208fmr10973300b3a.68.1768872707691;
        Mon, 19 Jan 2026 17:31:47 -0800 (PST)
X-Received: by 2002:a05:6a00:ac4:b0:81f:7db2:89db with SMTP id d2e1a72fcca58-81fa188208fmr10973265b3a.68.1768872707155;
        Mon, 19 Jan 2026 17:31:47 -0800 (PST)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa129199dsm10227896b3a.51.2026.01.19.17.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 17:31:46 -0800 (PST)
Message-ID: <1e19474c-4b0f-4e68-84af-4ffe9c8c0f8b@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 09:31:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 ath-current 1/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org
References: <20260119140238.3360658-1-miaoqing.pan@oss.qualcomm.com>
 <20260119140238.3360658-2-miaoqing.pan@oss.qualcomm.com>
 <CAOiHx=nBLtSFNhuRZrHn5z8bCrA5nyuS9G8B0nh-WTiFU_HUMw@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CAOiHx=nBLtSFNhuRZrHn5z8bCrA5nyuS9G8B0nh-WTiFU_HUMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696edb04 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=D84e7DIKQFjpkovS06oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAxMSBTYWx0ZWRfXyCAXWNeepIHw
 2YXkGLuZVyJCG1PJEE4ps9AWX2gqSJRZuX9CmnDRUog53ByphPt/5bvWyxRLy0SwzrFr5f+Q5ew
 5K/fgTQGj5RTQinz11jjSi4ppCCv4yHtYSUDF0M3fL+mOl/6UAKBnxZAlF8HbnYeZ2qVT0lTP89
 laYXvhs4YFoPaSvVVZvE4+F9ed5mDVWHjAPw7VZeqNA5gvLhCt5aYfR1LRRM5p+5cHi2BqYhX2G
 qx0eH0BYRbA9kiWJqcUjOu6m5qxOPb0DNtEM5OpThD0bPu/FZDupbP2yi2N4hcvgylzH/aaxj6r
 dUTYwywj26qXYHG99degvnsxa03rZR8xUUTWWZNVQ/8vZGTXn9HRdZ4+YdO5d++S6g5QS2DCM7+
 SAcV/QNO3pld9959/CDoFp05Zo0Wqkz87+FsECa2ERHvXpyeFLbUd56JZV2Xyb3y/fa08b9pGzI
 myitJWcc9EMayzxgMgA==
X-Proofpoint-ORIG-GUID: Di3c4w2mAN5DnpL3EUQBu27_19BZ-zOE
X-Proofpoint-GUID: Di3c4w2mAN5DnpL3EUQBu27_19BZ-zOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173153_535004_15789F28 
X-CRM114-Status: GOOD (  23.50  )
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



On 1/19/2026 11:56 PM, Jonas Gorski wrote:
> Hi,
> 
> On Mon, Jan 19, 2026 at 3:04 PM Miaoqing Pan
> <miaoqing.pan@oss.qualcomm.com> wrote:
>>
>> For M.2 WLAN chips, there is no suitable DTS node to specify the
>> firmware-name property. In addition, assigning firmware for the
>> M.2 PCIe interface causes chips that do not use usecase specific
>> firmware to fail. Therefore, abandoning the approach of specifying
>> firmware in DTS. As an alternative, propose a static lookup table
>> mapping device compatible to firmware names. Currently, only WCN6855
>> HW2.1 requires this.
>>
>> However, support for the firmware-name property is retained to keep
>> the ABI backwards compatible.
>>
>> For details on usecase specific firmware, see:
>> https://lore.kernel.org/all/20250522013444.1301330-3-miaoqing.pan@oss.qualcomm.com/.
>>
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>>
>> Fixes: edbbc647c4f3 ("wifi: ath11k: support usercase-specific firmware overrides")
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/core.c | 36 ++++++++++++++++++++++++++
>>   drivers/net/wireless/ath/ath11k/core.h |  4 +++
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>> index de84906d1b27..1cf7f4e601c3 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -1044,6 +1044,42 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>>          {}
>>   };
>>
>> +static const struct __ath11k_core_usecase_firmware_table {
>> +       u32 hw_rev;
>> +       const char *compatible;
>> +       const char *firmware_name;
>> +} ath11k_core_usecase_firmware_table[] = {
>> +       { ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
>> +       { ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},
>> +       { ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
>> +       { /* Sentinel */ }
>> +};
>> +
>> +const char *ath11k_core_get_usecase_firmware(struct ath11k_base *ab)
>> +{
>> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
>> +       const struct __ath11k_core_usecase_firmware_table *entry = NULL;
>> +       int i, count = of_property_count_strings(root, "compatible");
>> +       const char *compatible = NULL;
>> +
>> +       for (i = 0; i < count; i++) {
>> +               if (of_property_read_string_index(root, "compatible", i,
>> +                                                 &compatible) < 0)
>> +                       continue;
>> +
>> +               entry = ath11k_core_usecase_firmware_table;
>> +               while (entry->compatible) {
>> +                       if (ab->hw_rev == entry->hw_rev &&
>> +                           !strcmp(entry->compatible, compatible))
> 
> You should be able to replace most of this code by using
> of_machine_is_compatible(entry->compatible) instead.
> 

Thanks, will update.

>> +                               return entry->firmware_name;
>> +                       entry++;
>> +               }
>> +       }
>> +
>> +       return NULL;
>> +}
>> +EXPORT_SYMBOL(ath11k_core_get_usecase_firmware);
>> +
>>   void ath11k_fw_stats_pdevs_free(struct list_head *head)
>>   {
> 
> Best regards,
> Jonas


