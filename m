Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8A8CD37BE
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh3nvFiz423tHsaXjpNyatcW4vupHb/Nckh8n2Gl3sg=; b=fA8bqI5iGplyvkpukFSlVPFz4V
	T9+KYlygKOdVTQzdQCCIPAbwlA07UDZi7Z2MuMnhJo3GdYtYYpcuD88JfvlASgJ5hO/PNxRPYL/xD
	b+XOD2WccBEgkG+p3kljuIXVbA0E4zuSFe415lc0EyUg4NFPgbATO9SRqgmRtVj10g1sLychZ+RI6
	9RwxKv/Yb6kGTCCVM9ixx9oxQqm8lRCFEVcIRRM4Rpq1BYv27UzJ+td4gu/WMjzMuExcZhZPK5DHR
	lX8i4Ba2iTW+KkJCl2atgVgoB92yJXDNI+U6HkemnbEWpW/d4643GIp5tM3kMs2ekzSLks+A4Ir5o
	0xPKjKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdRb-0000000FKhV-0mSp;
	Tue, 12 May 2026 03:06:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdRY-0000000FKgm-2JEU
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 03:06:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6fv82995966
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 03:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oh3nvFiz423tHsaXjpNyatcW4vupHb/Nckh8n2Gl3sg=; b=cocKDdfcPRa3jj4H
	G9vsRupw4ZWEhq/Su7THwWfapVJTBeBI2+wZIoBFNZ8mx6aJJMHq05dRWI1MRPNG
	9ytTv4yRMX5BaxVZZznVmuyc9xdwntUkIlPXwov6fx6e8dzQdxP3DuN5fTy0exSz
	0YyzEjBsWYjXYf9Au04YCVrqOhD9bTv+1v39IcUpzvOxD4xI5YsMT+7C5m24TK7y
	s9ZQdtraVHhTfBShQRWsxHKrOb8AlBMcDlEQvxzb3ln/aflw68CrDlCb73KOJnFe
	uG6bq0T8HW5ywSFy2yfmprqu16vrFmwQ5SNiA5bS4a/nDPHwpzXuWs4TfrV7ae7X
	YVdmow==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0s72n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 03:05:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso3218022b3a.1
        for <ath11k@lists.infradead.org>; Mon, 11 May 2026 20:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778555158; x=1779159958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oh3nvFiz423tHsaXjpNyatcW4vupHb/Nckh8n2Gl3sg=;
        b=iXbV+KzWxYgZq1VNOX0nXcA58YLgyiuph+IGZT8AfwCg07aDC+trQd2Lq+GO89Sf4O
         J9aAWcKBA46ne4CN4bEL5Wz8r+JfUrMbXxNjtKn2eBfyGqtkdVeIeVFr5112s0hz02Nu
         JFxRvx+YXBSN8Izw2MNqSHVhX7HgHXyZCOAR7OkA16YBqGt6Kw1vIEAlKj5GswBIjfCf
         mvtEIIcZ0Vs8SKoZZvsl6Gh8cfw9jYRxnU2HOcQDC5KU1iLM8rOlUToCWdF/twkZZCQw
         JwhBbfqRzI+XM18224T5zh5x44MtjGVy9msi8Zbat4D/Kdte80uW3ATcIKDpPAYst/HK
         RJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778555158; x=1779159958;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oh3nvFiz423tHsaXjpNyatcW4vupHb/Nckh8n2Gl3sg=;
        b=cK/oBhDfJz/SVnN7KmxvmiHqc6iJdAJHgreyMeLbr+9qM05VdO6GXjZVlMa5GDdR+q
         3U+v11tukH9W16rjWM1VfYvqDW9BUVbPqN0G4K/UNAN0oBjWbXwSwFVSQW0TBrH6KLXq
         8Gn60s20tnLkzFEJQJoSeMmj8JnvKfclxIDdrzAwk19z+kQLvyq8HNgPYA8qeVRK764i
         vL7dcmDFjeI6M7muYVjFDResV4DGGdXee16DXFnG9D+pNEhejRGOHXU2MmtWY6jLhiBc
         OPLigzJNP41t4vNkU0n+bhFOXlq6HOVtZDrGbKX2unHtWjKQYDO8yJyb0LP318+ZE6FT
         UfVg==
X-Forwarded-Encrypted: i=1; AFNElJ8LOFKix8dTrocef7e7WLWeDv5MmAJJ2jiHDnonwwUL0oGikeMY896soD4XKEE/7tpLJKyy2po=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwNslq+AqP88rYBRhLmbMTlqPXQEEqAzTZrIYIAsKTY/Wm8ajG
	EevIYuhm+XQmBc2I3FiS8Jsqoqq0Ci5LNQscl+0WVMb1hjoO8Ts20bZOr3aji6cVizKXgYJADBh
	x2w9lO0iSWm5uWLUbT+4sLk6p+dSDnecUK10uCpGrVVIvkt644NlonDKvNxiyj1aqey9G5dIYSy
	8GxA==
X-Gm-Gg: Acq92OEKB7/NKRYpCtNGZ2QE359St4O1Mhg2NVXN0qbau/ImhiRT7/e82MKP5p/hLpa
	haiTvQ+1lR3xd5F7IsjZN97rLwQ9EhbX18bPpeRnLNOv+/fyXsZDGgHF0sMEBAyIYkbFVCaYkhc
	UvdNHVnhdjY5EfSCEsXX6ON6ahBXjxnYNKXqKGTuN8fmmd+fi3/+XS5j3BFOYa4LH+Q4lURN9F1
	TMBnMQXiW9sL2ZqHk5RPX1ER0doM8Ub4y6ZJ4IjVboZr9Pn3UNsvAr+2ZUG/BcuyG2H014t3Kmg
	tz3ne64ngyCIjDPXA1JT1Ee/GYosgjYhMB0vy3hdiOdQhs0rKrLozFvD31Fr3Qky4IVB2meftdx
	CYN+x5GoL9EOd0VXVJSLourSKm4fwmZX5qKbTzhVGeXHJUeP2VNSHojyBVJAmArwWeG4YUvjirc
	QX7Jz+ok6MwBjmBkFGCCE=
X-Received: by 2002:a05:6a00:3d01:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-83cf5846bf7mr17634671b3a.16.1778555158057;
        Mon, 11 May 2026 20:05:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d01:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-83cf5846bf7mr17634622b3a.16.1778555157387;
        Mon, 11 May 2026 20:05:57 -0700 (PDT)
Received: from [10.133.33.178] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbee14sm29115974b3a.48.2026.05.11.20.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 20:05:57 -0700 (PDT)
Message-ID: <a4247f76-4724-4c35-926d-5b03e756d8d4@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix use after free in
 ath11k_dp_rx_msdu_coalesce.
To: Willmar Knikker <willmar@met-dubbel-l.nl>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a029917 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=9B1uR9gGAAAA:8 a=EUspDBNiAAAA:8 a=ljBxYmjjx4en0H8xEuoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=8R3p93Tjo66ouot214C2:22
X-Proofpoint-GUID: MFel60jszGHv38NRgxYjyrnO4P6IQ2hc
X-Proofpoint-ORIG-GUID: MFel60jszGHv38NRgxYjyrnO4P6IQ2hc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyNiBTYWx0ZWRfX5Ht7TlAIJN6j
 kJ8r8E3jcJMZuLHft7LgQU6YkxGgf0qWVjLXDeLIGk/E9TVQ0wCB52+CmlaIifWsDIZiKzGz5tl
 HUTxyc1mXKzV4Gm78n8KDMbD5tK2zwagwjFcU/YsUDHNWXO0MK0zaTr/eWzzP5KONsG+51zjQ7Q
 TGVy518FtOrzi1Y6pWDONkVG7YYJD1TH/9etZ3ajgOxI4QIxVpp4hoxp7RGMgh1KezHgaDo2e6R
 rIGDqtvkCkfoqaUGutMn0R49Ky10O9H6l8I8y5tpmXkFwKrWTm6Gny80Y2JubmKNGlAfueL/XiG
 gGbzTAUzEDHVQ6TEeXshysB4ueQH7ZY4qtdSNPDKk+MEZQKspgnJFMEViogTTljWJXunSDRX4V0
 pVckt41UTE5GgXGIlBUjpKt9PZJ2j337V4I1hrWKOyD/WVnAcWkWQn+Ec/GC8SQY+b5H9X5Ihnv
 b/EXXm6kE2Q3D6UKsTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_200600_717668_9F5F6D52 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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



On 5/6/2026 1:17 AM, Willmar Knikker wrote:
> In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
> the dev_kfree_skb_any. This can cause a use after free kfence.
> 
> Use flag for caching is_continuation for use after the
> dev_kfree_skb_any.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


