Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FA1D35687
	for <ath11k@archiver.kernel.org>; Wed, 28 Jan 2026 08:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y/4AduHygOOr/US0JTx0tGB3z9DY7O4M+3RFP1ask4=; b=RfXMpNdXCWQgFnDdizQ0eFF9oz
	VCIkzGvDMp48Zbc0Sj16QvL2z2S+G8Ah500/YXD51qGceR2rMDBKcc0T4M4R47xpDuhLKR5F+j0YN
	7qnMc0ThIa0He6upjkSckl9HJjXkzrfvoJbVLP2WoPvzKYcKcd1Uc2seRPD2DL6YM3PGxOLZ+V9zR
	3NV4Kja3/I+dYMlD9rDqNdKkhX9J+MrYmwbtXWnouisrzwxJDFzrpMdM9Tv55pNhFCS3RWkcwJqyG
	kBruYLfzF4IHbvJC8jUxaP16IPieEI88k7pv9gNsIsJZwcCJvj1lST6uPd5jxYUqVB06ITb1bA0Im
	+ULhzt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0Z7-0000000Fdvq-2Vm2;
	Wed, 28 Jan 2026 08:06:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0Z4-0000000Fdur-2lh3
	for ath11k@lists.infradead.org;
	Wed, 28 Jan 2026 08:06:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S6kD5U2943877
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 08:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Y/4AduHygOOr/US0JTx0tGB3z9DY7O4M+3RFP1ask4=; b=mifdXvZIYWE52xAQ
	PmsTx5deIpdYsR/rNxxdJ9Sj6vzGBI2S9HurbN8sljxVdYdzIwLUK80fyb/iKK0k
	ayt5orAwL4S9tOjn/u6nM1KelAkhsU8uVZj2zkfJmTMhA2pg2azj5Dh993DTpnJ0
	DOvkh/LcRjNGK3tuaK+thOL8E2W/+3l/YP5PeKI1AwfgvFbEtFRcaomSzxXFlhM+
	N99VLKg1SJSkhGgJoO4W1KxuAsUZNmL3tLHzZx43ps4PJ7KGfAsz7lWf9QMzwRGW
	pbf3jXXcUzjyygkTkbtZl3k+2DHRXb9hyRrjjIFLUMFWdf60R4EEkafZBv7IldRB
	Avg5Ig==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk07wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 08:06:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so5621745b3a.1
        for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 00:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769587571; x=1770192371; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Y/4AduHygOOr/US0JTx0tGB3z9DY7O4M+3RFP1ask4=;
        b=GTl8gH+rgHvF7DbwIOErtY0lIeaTQhiaFti1GZNfB87u/Oz0KZBw9ppg9lVbbtIIA5
         pjTX28/XDDglAH+vCYIB7P34SHuDWs9+0ukX/TTQ7NMA9W2c2vnN9tKimsqxIhHKV4qb
         JduUerHbZB2I46hmKI5aM6rJV75z5bZOYD+NpoHckMVmezIbwssL3qzwJyCgdyPETDZ+
         D7WgLNFJB8GStrzB/LiORQzVW9Hn/YxI3I8hKhR7SbcOPVkKP9HG7Q48wFlEyR8FOlTI
         4L58Egu/BgtdK18ycDCmr4Gs/Z6oqj1Tsx8Ynj9VFKq7TG4KyHym3zHe/Kh3cJLONCHd
         BSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769587571; x=1770192371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Y/4AduHygOOr/US0JTx0tGB3z9DY7O4M+3RFP1ask4=;
        b=DodUqyEa422eUR0O72xk51YLm82sl35kc6TkhdYEWcnu83cs8rILO7l6gXSnL90usb
         j5FJpYu4Qh695hDWTWNrI4VTJyoI+qsVHxJk8gmJh/iOW1zjpcWHIPCeL4n9d2BZIOEZ
         MdqpzDqDRoSn4X1N4YRe3E8lQiImKoXcw6AIDKPn9QdSSrWn7aQvkzS2/V4ZEdP7z45T
         i48q2JmMJLUAeYE7kzMHRGFoaZhVvacuyjlATZmEVc52WFZQla4g4j2KV7Blf2Z1r9Ce
         UStgKuo1u4NusGy3YOMaT6si7OhQi1fVr0X8v25z2dXfa4uiw5xAfDt69K7GAnPhGvYN
         HRww==
X-Gm-Message-State: AOJu0YxcbX3kMVLVVQKgVHxt6CX8JCmXVYbJ12Clr7Oyegu+RViO8qKk
	mpMewFyChIS9nmG9YoXmYtFL+h0tpZXAydPdsOUzQYAIADHIuTFnwuUv2900X9IZ/q3/k11FV3y
	CwNZn7E5LE4hrR7Ca2GOQO1ZYUxM//cTPpGe+piXsTwXBJUbjAeonAHKKrNJ6FJ5b
X-Gm-Gg: AZuq6aKH/GUD4fYBkbRnwiIt7z+Ex/+z7ZBYt6petK2AvM8BrMPaE/w8GKloQPJqDKP
	XNSGsgGc2HO0+0Cg0N+Abb3IbWDzFrYqlx/IoSReJVbsio16D6TkLTDk+hRkuS+Yl9ADmyWiw3n
	0qF/vUTm+uyNRZNizcnAdlRCIPKc3UAXkBNaryoU5Tt3pVKtpT5qgxSGySdCXHn4OE2vKkSvotV
	MJgrQT9gSdxWkDvEZTohUkwj/tZgeHR/nSM13rIjYt2Sl+sH5VXxqgWn25U5D0e/98+toXN86DV
	KaBZKZoEJY5Y/4Ys6lfzTbznjDB4te+vT9PdJw5Ixk/nj7BkUvU0TDTprfvWSQV36Z+d0sHrkQJ
	ydGPivE13b7Yv6RWPjGZjGlkU9tzXv2pntzUNKtRCCMjOyNyPWCjR7+k78rKATAtFUckd
X-Received: by 2002:a05:6a00:cd3:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-823691608cfmr4740772b3a.1.1769587571372;
        Wed, 28 Jan 2026 00:06:11 -0800 (PST)
X-Received: by 2002:a05:6a00:cd3:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-823691608cfmr4740725b3a.1.1769587570872;
        Wed, 28 Jan 2026 00:06:10 -0800 (PST)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54febsm1762607b3a.59.2026.01.28.00.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 00:06:10 -0800 (PST)
Message-ID: <8e13cfba-5bc1-4588-aa79-6cf13d35dba9@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 16:06:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 ath-current 0/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com
References: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
 <74176aab-03d4-4095-890d-7ef1739b914b@oss.qualcomm.com>
 <32845805-5758-4c35-8818-ebccbfd9546a@kernel.org>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <32845805-5758-4c35-8818-ebccbfd9546a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2NSBTYWx0ZWRfX7dE/hZhCHL9u
 tNg+OZM1dJXoaG0dCiYGxfd7mGszsbIZwYTo1KEM65OFmDH05BCOQIiMctPpV1r2Zu6e6A3ri27
 AbmuK+FW7aVXxXaElAspxp4HcyCzmcCel4tg3OfOgFspch5PitjdQunukUsbjzPxfwOWt9pST7S
 iusFS/DzPWCq7Op1u2pRYMQ/b4nCsZhAii/KrHK1yPPOEPuzD2tfb7OBUFmQ8RXUZ8vX2bG+6+S
 04UZEfP5Wv3so8hrtQDCklKPv9YQixlpcnjbnQVnfcGuURcw73elUdqoaosU9/0AGdrY69ycgCT
 XsW870+AWvM0Ddo6X+n9pR3AT5Hlt1LMwFWIz+ewSiPsxM7ZyizWA4OqiEPBxMsV/We9clm+51M
 vHwH+JYcIGlfDoK64R7LAFYhKuc5K6MpV94VM+g2vGQsy2RkALgVqNQAo5xkIiZmvBeD7crM7zP
 BlvF9JBxiUANKOqlqMA==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=6979c374 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b4L-3lD8CPRiJR5BZnEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 71aJoKgwtr0raFdcM9w4PF8XTWnWZx2Q
X-Proofpoint-ORIG-GUID: 71aJoKgwtr0raFdcM9w4PF8XTWnWZx2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_000614_818044_BB465086 
X-CRM114-Status: GOOD (  17.16  )
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



On 1/28/2026 4:01 PM, Krzysztof Kozlowski wrote:
> On 27/01/2026 18:31, Jeff Johnson wrote:
>> On 1/21/2026 1:50 AM, Miaoqing Pan wrote:
>>> The 'firmware-name' property was introduced to allow end-users and
>>> integrators to select use-case-specific firmware for the WCN6855.
>>> But for M.2 WLAN chips, there is no suitable DTS node to specify
>>> the 'firmware-name' property. In addition, assigning firmware for
>>> the M.2 PCIe interface causes chips that do not use use-case-specific
>>> firmware to fail. Therefore, abandoning the approach of specifying
>>> firmware in DTS. As an alternative, propose a static lookup table
>>> mapping device compatible to firmware names.
>>>
>>> ---
>>> v2:
>>> - Drops `firmware-name` from completely.
>>> - Updates the commit message to clearly state that the property is
>>>    obsolete and the change is ABI-breaking but safe for upstream.
>>> v3:
>>>   - Deprecate 'firmware-name' property instead of obsolete.
>>>   - Keep the ABI backwards compatible.
>>> v4:
>>>   - Use of_machine_is_compatible() to simplify the code.
>>>   - Add back Acked-by tag.
>>> ---
>>>
>>> Miaoqing Pan (2):
>>>    wifi: ath11k: add usecase firmware handling based on device compatible
>>>    dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name'
>>>      property
>>>
>>>   .../net/wireless/qcom,ath11k-pci.yaml         |  1 +
>>>   drivers/net/wireless/ath/ath11k/core.c        | 27 +++++++++++++++++++
>>>   drivers/net/wireless/ath/ath11k/core.h        |  4 +++
>>>   3 files changed, 32 insertions(+)
>>>
>>>
>>> base-commit: d8e1f4a193101a72235416f189b01131a57e26e9
>>
>> Krzysztof,
>> Since you previously NAKed this series, can you confirm that your review
>> comments have been addressed?
> 
> 
> Binding looks fine, but I did not check the driver.
> 
> Best regards,
> Krzysztof

The driver has retained compatibility with the firmware-name.

static inline const char *ath11k_scan_state_str(enum ath11k_scan_state 
state)
  {
@@ -1346,6 +1347,9 @@ static inline void 
ath11k_core_create_firmware_path(struct ath11k_base *ab,

  	of_property_read_string(ab->dev->of_node, "firmware-name", &fw_name); 
//here

+	if (!fw_name)
+		fw_name = ath11k_core_get_usecase_firmware(ab);
+

