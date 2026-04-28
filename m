Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D75FF8867
	for <ath11k@archiver.kernel.org>; Tue, 28 Apr 2026 02:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XLBDj/bqWKMsmb8JuJKdh5tlBW1FdM5yrjutqkC2sA=; b=gD5yIyplLNiD8BLWycpnEShik9
	xXg9mG00Tj7k2S9lTrAZAgAYyCXcPoSjPFJ5DQL/fkPUM+b41h2mpZSrNu2HCvT10CZ71QguP4H1Z
	P7DeuYAWVaE2xcqq8mCbpYuNbLrImedIIXqlUWDukaSOGpvrfWls7K88tYAWNRifvl4T8hz7OjNXN
	BLBwbz4kADb0z+6iWr8nOdSHiLUfrrrvuJh9ueN+AttJmt3kODSzw4q7MigQYPpTRSswmmT8yM54O
	tpLnTeemzoAVfHk3+YjcrfsHtfR7+h6ukPpkL9NB1Gb8QQr5xqCr6HftYYCJBWsI1IwMLLJ4K8jGb
	RnSH8nkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYKD-00000000SE9-3VIX;
	Tue, 28 Apr 2026 02:37:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYKB-00000000SDl-2RNJ
	for ath11k@lists.infradead.org;
	Tue, 28 Apr 2026 02:37:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RNEIZw3760758
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 02:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XLBDj/bqWKMsmb8JuJKdh5tlBW1FdM5yrjutqkC2sA=; b=XkULG0TNT66bFe5Y
	9T1dh5bDWjkdat+p02yP3NsQR59f3kSgcxIienWVHATMlG3UmcDioZKhTHpYzYtv
	3ZEfiB4RP+Be/1nneZfygxRx4/MNHEpDlfgq390aOUs8c8Bdr5qxbDqg1n/U/45K
	6udtQWUxf/QqAgeCsOfjyAiLDdLNtbi/u83aNCBwNn55TG2vx9WgvemiNjGdlEHC
	AwR2Wy7m1tfbaDLXxn/QzrwL4kLjdBg0EtmGOA3gWNp9PCmsXOBxaY7/RC7O3ejZ
	coBXbU2zR2xxR4NB+PWC1T737LFsOPpSmcR5G/ExYubxdp+eYimq+QxAYgpGO0Xq
	2PW1Qg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacdt82k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 02:37:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so12794522a91.1
        for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 19:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777343842; x=1777948642; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XLBDj/bqWKMsmb8JuJKdh5tlBW1FdM5yrjutqkC2sA=;
        b=eGngJPU5BNXEz7tg4D/Dhf5kW7ekYz68EqHgFUnfrIHHM7BQnk3NYgEQU4QvHsaqxt
         ZVso6ZeTdYJ05mWGFAxnu2fFiyoBX2/WcG8aULh7aw/IOZf5ktW4BQcrzGP/ZGF7DNX3
         +hVHb1dFIQF79RKaRnkJqh8ROyq4wrHVGHRzH2rzv1ibbkgqO6kT7wSgWcpTABF2Sopz
         M/IGw3UliosbWtlh2c0gOn0OkbXqGEOaKzgVqIV4MOXDUzl7thgZVNI2OY8dZnZpOTJn
         sYfFKFBjgVHAxMLQ+q8MoT5DyErTdOEBKtzEALDrDrWRQp3P+e+lzT++qKNt1OQeYyLi
         M4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343842; x=1777948642;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XLBDj/bqWKMsmb8JuJKdh5tlBW1FdM5yrjutqkC2sA=;
        b=qRnQLT5xfAwqiNwDKkjEOzNhj1bDGivn0J+ZDTSAz8SpOTmIrtlHXnpAQLwO89Y8kO
         LwK1H4mfyEPUL2DqKU0aAGKKqo8meDMjTZcu56oWdt8RTe5T+OPi1e493G0CH37vEo8j
         HaceE48GUW7p+6Y4ytjxXhbqB8YOrRwI/ztA2C1nFLT3FKqEp2oy4Z3oMC7Ly1ksaAUs
         HE2Y6DaX9WdQkZhdN3kUkEFtt4euNsuJno5a4JNgNYhBw0W1R9HoYq9pT136snXh6scy
         AQbo6iAxfSTViz+xEWm5ZZuU0DA0VwZ1wg9Axgsm6IftJILdGfrh1DYU1nYu1RDlmNzh
         cgig==
X-Forwarded-Encrypted: i=1; AFNElJ9yuFccx2hkgHrAIyvpiixN6zoQ2JcB5+xo+dsY3TT4KggDwYv+VauX3iobbKvfNwbA79RnSuw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiJI6Q0HdziB4760cpVsdNWRVRjSJ5XkNEtnXtmkG12GmK2bsQ
	E+5TfQoyXMuNY+fDaBxCJNRH+7itQonOGHhHwoLM9NyfDTEgXPAaYMGENjP9nUA0VBFAb32Y7Xr
	VI/7wIQcLQCmI5IDS5G8Fr1cYgWabrZPo0IemOeM8xiFCR3jwyo9ID53H0CIAoVsw
X-Gm-Gg: AeBDiesn9N5IoL3cfB5sGddBpuzT1OpsONt58i9CUH0EMfVRiVih1peoJs3fjUfAzvi
	LpR6wUO9f+Y3iWTCQrLkb9dDtg39cxzdDzBFKSTgc5fZomHs4/a4HO+ZpYL6wd6Diob75M6WFsq
	tXu5DfZ7PkSILDtsiJwtpoYO7ylHUdUZBPEhLnClf4sOB4cUr4ftKnq4lYO+yp180D9JRWQqTTQ
	T0DW1MIvudpO47NkVfOYDpYfX4J/2OJHazyfgpMiezvWi9C5kGRR2djFV4/A2Jr8a6J7YZ3QF1K
	XR3YxEkwG/X+ibIh1sGrMPhBGslVTdjNcp8E8BWBc5P3dJ/Fd+cMUJBaPsAI8skGI8Y08cZprYI
	oRmlOxnMBeg+KZ8t6rEACfagkrDbLQGHOVqo/PfGzfS4ces3v+wZN+vlW2U3NIcyEwtxsdIIFuI
	SmLJ2hl5i28bJRrRZ1rs9NEDdZo0oIKA==
X-Received: by 2002:a17:90b:4f91:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-3649206916emr1071933a91.26.1777343842115;
        Mon, 27 Apr 2026 19:37:22 -0700 (PDT)
X-Received: by 2002:a17:90b:4f91:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-3649206916emr1071908a91.26.1777343841595;
        Mon, 27 Apr 2026 19:37:21 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490cb3f98sm328583a91.13.2026.04.27.19.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 19:37:21 -0700 (PDT)
Message-ID: <263f598b-93e8-483e-95b6-3ba9b19ee8f9@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:37:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 ath-next] wifi: ath11k: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260421231205.77361-1-rosenp@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260421231205.77361-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyMyBTYWx0ZWRfXyqsZhn5JbpI8
 xIZTBmYc6IDFAZLr9H3jat4Cjk1VorqO9Ue+QcAYjGP2O7e7oJ0aaOSWfN+L4dv166LJLaiNNNz
 P/ZUJrhkV3b6g63DMuV5bjWJ8o9FeAYM3W52BcM0FxzkizKo1IsXboauty6sQDFFizDC2K9iZXK
 XdI+6xF4Mfdn/6uBzZFhy5YDi3aBSm+EuOoGOennaLpKERSbf7Gqk4E+DXF+FdG6Vemk0Z66FBB
 pdPaxpl0Ww7nooLIs0Tl5z7Gnbj9OlSKYylqIBYrUaO0xn10klJJBEAqYr6h6rGxHtlwpVX/h/J
 uWolVv5FyDCrhny9ZF2sbtqT1IYeG2311vGEvbBbDCvzjC51VNgLmXdz1sBhrMsM6ogUlkx7kAG
 TnEHaY7dB/zJ5CWVx1giYrb3FSLlOphzRX9nXupSyTdYV9gQfgzjdQR3bQJ+Ngbb7X1VZR00MvQ
 /nA5KX+ukZRmPzQhexg==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69f01d62 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rJ_IYOnZYG8bJ-BjWygA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: SmZJ4iNDQsK_RlhnOIr8DP1uly-oIWyQ
X-Proofpoint-ORIG-GUID: SmZJ4iNDQsK_RlhnOIr8DP1uly-oIWyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_193723_660864_6B824540 
X-CRM114-Status: UNSURE (   7.10  )
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



On 4/22/2026 7:12 AM, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation before any potential accesses.
> kzalloc_flex does this anyway for GCC >= 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


