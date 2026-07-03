Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2774C43458
	for <ath11k@archiver.kernel.org>; Fri,  3 Jul 2026 06:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfCsJor6zr9JsHaxgfb1o+ZCD1IlPkC0zKCAWBS/gS0=; b=jt6Y3rF6txyBY6D/6zclccYFr8
	ki36+/HD8b4z/N7XHkxki2CMQ71Ccc2ozoIbzZTGhYWDU/QY2nMn00bjBZqeoHuyINM8TSa66obUr
	P+1RIALXBSKOifmzZisf2j891ychTXHI5XQ8kh6MjfZp3qamag29bwUHX7gLAi4gFeSUozFt0Nuxi
	0OUdqBbCqqJNP+f/CqWNK30Sh+mACFucxl6HPHm8FRAsaGWT3eh6V+ZXVYv8L1EP5INWGwRPaim3l
	ZUlFZ6gNjDkqjz5VkG3HweRQUrx8XqHsAsceFb3SiT5Uc9+bzfgq2rgWOj/titCIRqQj8Y0FWUCOf
	RJUHXSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXeV-00000006C5Q-2ivZ;
	Fri, 03 Jul 2026 06:45:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXeR-00000006C4k-0KKZ
	for ath11k@lists.infradead.org;
	Fri, 03 Jul 2026 06:45:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635ro6B3135212
	for <ath11k@lists.infradead.org>; Fri, 3 Jul 2026 06:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfCsJor6zr9JsHaxgfb1o+ZCD1IlPkC0zKCAWBS/gS0=; b=hiSvtWqmwcoBj3sD
	tQKWAXmYbaBpniUdOco+jxUBFPFfnfA1KU2X1Gj+q2byMnkhAQmjPGABzhlMMB0U
	1iiqZndY8/9DJECEnS2XQprlGyO5NiWAS59woH22eEsD33aw+RL3njkNRlDI15o1
	JBbFoO6aK18sC43z/EuypdbGTH3QUeT+7LCFxLTzDsyxGzZSTZv4juAeqGEVqObH
	iyXX+56/D88FqYqg1tAgW/KzOY0V7W1MXPKozIleggk0vp16UF0F42srXGTFf02q
	jjYvRK35i+mqueQN7Rj9zDal/GEeJdD135GOUI9EeCDpA1QYwsZE56W2csLkggAo
	sCWJgg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcgrd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Jul 2026 06:45:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c98136ceff4so460686a12.2
        for <ath11k@lists.infradead.org>; Thu, 02 Jul 2026 23:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783061125; x=1783665925; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfCsJor6zr9JsHaxgfb1o+ZCD1IlPkC0zKCAWBS/gS0=;
        b=b5z1dXVX4gKbGrYJqa1Ks1kj2Iie1tXg+a2R5ibJi9ytoRWWfO215ZqF0o7VputkPw
         wq/9eGYxRH873B5zZr0svfKqE4sF7+LctwqKmEe0HH5vom91LtoPZJ90NoFrABxPS491
         i0eDkCr/dnpEXkjnwkn3S2sbi4RclP9QGEyI8bljwv4kS3wlDieMgaf14MAUkS5xkokj
         wDICDA/EyLStJk8D5YGxAXWFQM4muuwWh4nw+4GtPFIBtY0SpCp98zXif3qNUSPZUCpz
         /RVz37K8ggKkZQGfpZHTmRkF/BEPv5AbzpDacRxqyM7YOg8ktbzfoMbt5SE0V/t8/+Fw
         3NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061125; x=1783665925;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfCsJor6zr9JsHaxgfb1o+ZCD1IlPkC0zKCAWBS/gS0=;
        b=mgKAG9zh6hTWU8slToBZiVUUr4ZRtn7pzuAlPCkG/WxRiYKCOoGm1nJCYeYDY4hoKp
         MfC7VC9k398Y+52nOFobUdtfaAu6sxaYevMAFO37pqc8FPe1HOIUmcVJ22ZwPHiWrGQW
         xP8XwwksvhcDgmNQsCURbIkVwlKG0AtGJhRqamA+PDfE85PyGlBm1/XpiQ46FXlX9o22
         hdZmh7nR7YJ1n5ECSD25MRm1veVpkANlAaREvQ+hLSTEXenBlD0fz0HKKvC7/q3xpT2t
         nHcS5qolxvWYVJXAlW6qZbwErMsRmuy3EwOtgqwltfK8UYSnfRg0kmyd755+Olz4ygT6
         uRNg==
X-Forwarded-Encrypted: i=1; AFNElJ8v3rA3368D8c/Iz/EchPp5kN9fcfO5IfIzOimf+x8dD922o0hOKlFB61433cX6MrXtWEedVr4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv5RRmExf2Yf818X1eQ/hF/9R+T+91nHGKZgh21H+1tkqlkeh7
	cIDrrUuWZG3ZcVfaRtKKpkv23M9yHiIDkchODZBWmEWMswIBBH3kO0UVj7fk3lEjjRt4+0n39uu
	gi5tkroZV2Qde9pFT4A7Vg+j+J7/5U6IYFuRDuKtDYC9Inq8dKPNHehBNZkwK+TII
X-Gm-Gg: AfdE7cmi0ORtKtXOIeqNo5GIuAxPC+X4Pr8nXYc0zBNseiO59Oif+FDlfD0n4HnY4Ou
	rfwlLG2PfAnS28zJc9SjOfab3fBt6IEWZV5uaTTGM3U7VRhwSxgQcz9EPRFXqSF9naeheYHWD9h
	q6rMjfcnjn2TIzHtv62gJPZlIQ5DGXsU0kfjg7+kNUW9E3IKeRI7DlR1qJm6FGVOdw3yAtcyo5X
	ZFoWQrhEQYyriGRzMdIzZKlAiwVlrVpYQMX2Hp60DhjYzHQx7D4xDt0WuSDExPcr17ooH0OH9PM
	66qCMz1jk6TFadriOhBNd1VxjX/kMuHJlxHUg3lQwsLABFTkfu30S/nhJR9Hk+u8C5/tXZ9FaKQ
	vaDVwz86K9d8SZKDgyMGXJgRo+llYalyYe6DxpSTMztOSbXfS7+7uxOkI1IvsRoTpNa3OYuyQmf
	E9q4JLuwLO
X-Received: by 2002:a05:6a20:3ca7:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3bff42daee4mr11446772637.50.1783061125022;
        Thu, 02 Jul 2026 23:45:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca7:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3bff42daee4mr11446741637.50.1783061124596;
        Thu, 02 Jul 2026 23:45:24 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm2367706a12.5.2026.07.02.23.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 23:45:24 -0700 (PDT)
Message-ID: <f304041f-c570-4db3-b27b-86d85dd41ec5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:45:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix potential buffer underflow in
 ath11k_hal_rx_msdu_list_get()
To: Dmitry Morgun <d.morgun@ispras.ru>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
        stable@vger.kernel.org
References: <20260530114252.42615-1-d.morgun@ispras.ru>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260530114252.42615-1-d.morgun@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jtVU5rT-ar_wzl3UaJgzN5zbrpfSAzCi
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a475a86 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HH5vDtPzAAAA:8 a=xjQjg--fAAAA:8 a=EUspDBNiAAAA:8 a=zEb-VJRgp1rxa82pEt8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22
 a=QM_-zKB-Ew0MsOlNKMB5:22 a=L4vkcYpMSA5nFlNZ2tk3:22
X-Proofpoint-ORIG-GUID: jtVU5rT-ar_wzl3UaJgzN5zbrpfSAzCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2MiBTYWx0ZWRfX+EgyF1Fse0Ea
 VQ8K2n4SX2sJCYz8Sf3UdpS8GdbGCnby+1B954Yy1mL4WJA2tm1ilTJVNCt39QRJFMCKoXewfHJ
 UeGcQVNdz2RsC3No4a6hkYFcfY5LbfIsEt5mlarZb8F9cbniVFg0SozTXPlldj3pLdwpCKy6qg+
 33sKVE9VZUCbSICbZjpHW92pL0f2Sza5IoDTRcuGFfppqe/etN48hrFuollqmthPRC5D8kAaCZX
 hqZ63wIAtnnvBLfNSxuNQYKPwNpKZnc66OgLWYGxM8pf+ewnoI0ifg2BNypSqWR0UW86wdZKmwH
 BACjOFhAG935vNeV/GkLew5X9IoOv8b/8YWgd6on7lYwhi1UrRo5xU9UPxMTkh7OZ9b7Mbj53Iq
 6TmG6tB7EQAQXm1sHhANc3CDx9E4tJWv54G/SmLLky9p9NuJvj+l8apOaKtDLXDqAxXlb2jvoCF
 ykwzGpPZ9JA27iYs/uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2MiBTYWx0ZWRfX6dsa89MNd0LF
 5L4HlKrWk06bV1C40xVtPmFMhYqrIcp3VzKlU9AhC5WZEN+sArD0u80+1XXQ+9X4LEtWPj9YWAp
 s0LdjMvp2hgYuRI8xteXTzQmkPJf/1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_234528_316602_4C891848 
X-CRM114-Status: GOOD (  10.28  )
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



On 5/30/2026 7:42 PM, Dmitry Morgun wrote:
> When the first entry in msdu_details has a zero buffer address,
> the code accesses msdu_details[i - 1] with i == 0, causing a
> buffer underflow.
> 
> Fix similarly to ath12k_wifi7_hal_rx_msdu_list_get() by adding
> a separate check for i == 0 before the main condition to prevent
> the out-of-bounds access.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dmitry Morgun <d.morgun@ispras.ru>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

