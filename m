Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993E2C53200
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBOrrFUaJtsfvmkvZqyRp/Ke0BbDoZomzwSefP6ue+w=; b=DjTwXInHXN3HN03PgLq+fjB/UD
	AjKdk6Nl0dXN9Cz1Me4FS+688sSnh7yk1Fom4EgJ4Mm9bD80/JmQx9ie+ttW0+q4KCt8yhzFXuaSy
	03kXG9n0X3tLSujEfrw6AO4tM8RLZWgW+84G4h2J443C6K1xvxqUmCngaut3ZTmc6uGSsLf6Lwk6Z
	RO/dq287gBm8cp6otEvge9z21jLNW1OP5cvFQXDOPxbkCwp0b9kW4s2G9NAbpDQfq6iaHzIxKF4rf
	ZzHTUVtsagN/LzQVtL4BIhvfmBNE1QHtlzngXZ8A573zM//pDANNc2WvQpbaUDuZXrywujiWz0ZO5
	8pBNMHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0EP-00000007JYT-05Bb;
	Wed, 29 Jul 2026 09:05:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0EM-00000007JY5-2yDF
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 09:05:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f1TC1088626
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 09:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBOrrFUaJtsfvmkvZqyRp/Ke0BbDoZomzwSefP6ue+w=; b=ny90bndpXhALLEDO
	In86EzGjmP7l9+McPk22Q2xuhWQzTd8PCXBGct4xLC0BYWPhzzNTEe7Gb69P0a5S
	OJLgqvFWWqGrug8+bNYJFV6l6MGTT0ew8cAhyETof7/Iny1x7vt5wUWHTLVTBy6K
	E4MmRu1UvIKjdlx95CgPJbk7R8Ur89bnKUUiju7OHn2c1qISELz51PYC7Dxi1nKz
	7zXklqx274lgX+Oqzsa09GbjhmA77z6cvXKpYN7/ZBH4go+U9R28GkKwJN7TIuqV
	5zgA6CZGoUze7AUjHIlae0y0xdeu2x48rjH1QlVTQq56c9xpGn6K5ROMinFesisH
	cNtBNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sahxj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 09:05:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfca8558d2so10763585ad.2
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785315937; x=1785920737; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VBOrrFUaJtsfvmkvZqyRp/Ke0BbDoZomzwSefP6ue+w=;
        b=QC9bWCFS05VlWD6Z4ugzg6uz+GkEq/B80dV3fDFQsIuSBnYM584Y0An9TTIo9yIqCg
         ZvVXgaGsT1HEQ1VYGJ1+bMrlLqY5PHoFhlnaIuscU35KHwQcrId3YPKlc2dTHsXYAn4e
         3V79fKUB/IiurCl9taLE8M/gryhSnCrrwWjmxx5v1FZdjSKawExn8WBj7e+kwDNI++WW
         k6deYYo7Gq3PKRiwXeOwqAzWo24x+7SsJ09xvxx8IQdEBD6NUH/rkpP1etAjjUyJJdTD
         Zn9aY6LmCRdUd/HPaJekyXiQzzXaOQdOD1cCoX/MbzZ6q9vvikzQ8WZTKFoCa98mEID5
         kGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315937; x=1785920737;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBOrrFUaJtsfvmkvZqyRp/Ke0BbDoZomzwSefP6ue+w=;
        b=DqfDwipWWPDTMz7PLrRVt/LTPU2C6bcmV0FYE8SDQqCGNl9STWt/fSfQWuMmNzX+Jx
         Kc+G8gXnIPt3OTvrqPFdnfxXvOj1JncO3OeWgK/HEyeR3zgcYgSUS+9ccS3jV4c6aQoT
         H+Jup3otEFMd5blFRg+WlNprBe5rRPX3M0NdHiiRWqkvdmXRdpGvneQuEjGyc6kUp7o0
         k1Qd6kq8Ql736LVTnXwcNr5p4UjFkvjIMK7lHo05tst9boSauQNCjDYyPd2DXQ3D3pF4
         L9NGqD/AVmGdcgNSfkw32/BCM8ARKkxV+aw+1myuVvwst6N1qlERXVV7d+5Z1cfaBv5P
         mavQ==
X-Gm-Message-State: AOJu0Yw4KjkxP0D8uXy5vQ8ihiPiEPAu5EXEh98hfXNcMciAIbnashFA
	mo4sHF1to08qNgnpL4gJieizk2/2wyawG+wRqpMn+tQdEcsvvmf/ClkpmMLYUoDFhPfhGvZCDnU
	EwX07wHf5JUpuJkzHwueHwInRAqpEQT/myNuJ51FZHHSwtgiKgdptAMKt51a07uT0
X-Gm-Gg: AR+sD122LH8YVBn4fAzQK9m9QLk878T8qjqyqvXHvvYDy5IYGhQEytZZzzQK5gOa8S0
	wdssLsiCIt6WWkJV0FUL5lUVQDR7rA/uNclyzT8FqYWYUboijDs0YHbn2I3KVE9kMZQK+Qqjgtv
	E3kwVNAq805OH/AIP3C0ofn6Bg0MxM73Uc7diixOgkueuDMMhJjjC3p9tUaTvpXAqH549hcIbmY
	7B5vpGp2oSuelvaZ17zTCRJw15iw7D19mtZmZ/mWQwdH3RSlpuZU0dKIrk+SpQuD/kojImPC8ch
	yA94fc2OXuJpbfor4c+sKSZ4dj2KH0HZSIBcq3fYFjLllvHoG31y531mdeSgitMSVOhKoH/Q6uD
	VKkKO+wJuKAskuZ5NkEyf3v2jd21s85QM7p0HIURudLP1kEG//vTv+Z3KOmA1rj+a1ttkGKGTUA
	==
X-Received: by 2002:a17:903:1aeb:b0:2ca:be8:62d with SMTP id d9443c01a7336-2d015d26298mr69152765ad.32.1785315937502;
        Wed, 29 Jul 2026 02:05:37 -0700 (PDT)
X-Received: by 2002:a17:903:1aeb:b0:2ca:be8:62d with SMTP id d9443c01a7336-2d015d26298mr69152335ad.32.1785315936912;
        Wed, 29 Jul 2026 02:05:36 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a1586esm8247835ad.12.2026.07.29.02.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:05:36 -0700 (PDT)
Message-ID: <13f6c903-e85a-4f3a-9c96-ffab95f831a2@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 17:05:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: fix leak in
 ath11k_service_ready_ext_event()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727-ath11k_service_ready_ext_event-memleak-v1-1-e8373d27bdd1@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727-ath11k_service_ready_ext_event-memleak-v1-1-e8373d27bdd1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jhPWRW8lH1Re3pezmDZ1MDhteF2i-00u
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69c262 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aNtGKDg7WqoNcE6Ki84A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: jhPWRW8lH1Re3pezmDZ1MDhteF2i-00u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3MyBTYWx0ZWRfX2Z+9qAbQVc8L
 BT/MD21rYOhhfn/jqO2Jo3ECXR7+JJ9fvwwzTc5UnAwZMbFSFvHmz1wIqwlqFfs9G+1qCxB/W0n
 TzwX+fgxIo79D72ehqnzJDN27zkPZ7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3MyBTYWx0ZWRfXx4dI8N435qVg
 CUTQCEiq4KwBsd8uLj1vaKwYRqWzwiO+7VC+JbH/YXFS36cr+jimjtWTx0rGxm6lMNK3MMTzZv7
 4f9KZ/rryRawbCwaHUcCEdKYPre7nLeCvXusBL7tKtqMhwrVKJXTr829y75+ZwK0r2ujXBJAqm0
 J/WMDBNQx+UNAjt2Pdaf8hw/cs+H0IKkDd3pVjERLSY2NRd6vnP8IWvawxn1hUSl99wOcilu/iZ
 5P8BzuURzt4bhgsYxC5F+xsb+goifFrokCUobIK5721/T+DuiWrhtL6Is+zCHx16pcPi9xnfG0b
 c9ePt3ZRtyuaVcOxQcbCfT9ssz8Pv+d+2V3CXprXkJ6gZKWFF2OJ6T8I9yWESBGLrZ3jV0L8N/f
 tkYoOx8WgiqwlsJ9TCAgUJOTIWR06NzAzsKVlnegCl35tr0FXtEd0J9WsCK2NeT0OqTGhfSD9t9
 eOmV8qmq+uCEuQFu37g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_020538_774397_F69FB95D 
X-CRM114-Status: GOOD (  10.30  )
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



On 7/28/2026 7:39 AM, Jeff Johnson wrote:
> Currently, during ath11k_service_ready_ext_event() processing,
> svc_rdy_ext.mac_phy_caps can be allocated during TLV parsing. This is a
> temporary allocation that is freed on the success path, but not on the
> error path. If parsing succeeds far enough to allocate mac_phy_caps and
> then fails on a later TLV, the allocation leaks. So free the allocation
> on the error path.
> 
> Compile tested only.
> 
> Fixes: 5b90fc760db5 ("ath11k: fix wmi service ready ext tlv parsing")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

