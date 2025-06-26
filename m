Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884A5C7EE31
	for <ath11k@archiver.kernel.org>; Thu, 26 Jun 2025 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ds5OIBbeNrEMt6KG9DFB3gNzCj+lz0ilvqEPiQA344=; b=uBQa7+TBha8xnMxYHwwgl7r6jp
	vHED/OKipcCUnOEkkOSwdpieD8NjzXiIM59xBWZJqDrYJgI4ix3n0ck1jtjmQEnca3KdZGQOKPr+O
	9lLKioBJ4xKUbFbemn5+JDgdrcFxUrrrDuVmvzJE2ehGtWxJD+law0Y99bHaqGXXSlHRPdkCxG7U5
	m4/r6zezGTk/uUo8uslcG6qu7ZDetUg+7QLvA1ao9KwSYpyrO4s0qMWHAmxwvlt/BKWDzrQ34w29F
	GA8qZzcC1D7ZEAjfzZpXsHCa8yWdhm9QPJG+MM8bcLYq8+wjEi1UfDBCN07nWP3aVZh69d0PLIqS4
	2mp5dXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpcF-0000000CIFw-0fgw;
	Thu, 26 Jun 2025 16:38:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpcC-0000000CIEx-1mGm
	for ath11k@lists.infradead.org;
	Thu, 26 Jun 2025 16:38:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9Zxq5029523
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 16:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ds5OIBbeNrEMt6KG9DFB3gNzCj+lz0ilvqEPiQA344=; b=CxtsjcMAZ006oS80
	533AEL//NhGDYWiQFz+DwVSvXZ2NRcM4DbBX5KhjKD8atNKwTTw/88uDrqkrDQFq
	CSRyzMfeiYRKQfJzhEGgqxPR3XJDACPMaXdCN/dAQ2Ofj4WWwJCD8P49lM2vyaNp
	wH87FM3YdqpNDe+dn4ZlVIqLygRGdcRT57qzEC8OKaj1wBtuyYrsLLm2KEIPFjMQ
	h8yOP72lw3VXNpDGYMhKhje0essOJkkLSqw/WP5D/rfM6fGARwnhJuyE/4wsAuAJ
	DXIqfMHytujXUYPNbEmFOSdt8zKS6VGnUwBr49i3LelR7qQCkcLek7gz7zqSjSQR
	ISeGFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4w9wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 16:38:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-236725af87fso15641375ad.3
        for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 09:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955898; x=1751560698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ds5OIBbeNrEMt6KG9DFB3gNzCj+lz0ilvqEPiQA344=;
        b=HdtVKpHhhawB8fOFnUP2sPWo5vS8Q7ir4SqVGArptCS51YFsiG8jICGNN6Qv4oGHlX
         kGOhEodp2BFn97FSZ0lUDN0mqdEbcPLkRn1SAIKwefpzqlj9sv+3psf5xGtuvNzxDKlc
         QQer8mv/HdDU8nzEIAofmodnSkZFU1gal450rKD8zlIinc7adnF84YQAHCuwn8pm6bzU
         TB244tqPpnsaTkYtOcujRxwCnbyaEOJmHQIMcIDiLZScaWHI0N1QqwtdsLJp1FeHLsqT
         +ZCLjohjwv+MarmKyLOJPRR+qCEckCiGLH7wDW2rJ+XlTGYAkBWJkx+od8GDrfSpYENK
         cEyg==
X-Forwarded-Encrypted: i=1; AJvYcCWi3GgU8QJvjzLPTBsRX9nSWI9j5TBKAWA3tmEGb3muI5fPqUQs/kCUqAFhwXmj0CVE1m5kKWI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyyy3QOWj+spGT5SjMescID/qgAtE/D/W9EgMmzLCI3YcGtBFI
	U96sRTRGB3KIN2mjm1QL5E1gHk4ZEq57dNUjGCaoA+QrfmUE8bJXs/5WWA1wV+UwrDW1Xd4lN2F
	kdRioMkGBgkNs+YSzHAiymuc9O/io1u5txJwglCR1Re6J/IOEu0auHdbhkoqzlyv4
X-Gm-Gg: ASbGncvUKNpmRfDCY46CMUBlYAqclmsYhuETKh7kT6mHSAR8fnLdYO/H80EOBMuzyQv
	FhWX+jv3gPf9vnIivWUb4oJtQjlbRpT9ibPzTiMKUO72XKAPghsiqC77+2PsAFqSh4yYHqR0gP4
	D1XfoiEmtZFZc7uk/PW0t125MB98yFJj0/C4ydXNxmiKoDrrIK4I0own6O/QsF29gjOTLZF6bkt
	pgOOZA+r3l8M46o4AP5I5Hh6sYyuPZpbu85qH4hrOawXmxs2wgOZwb9Sg7P2TlSw+0avr5dCofU
	lDPGywsFNx+m1yxasGUu5X/r31XOo4FeNeSkwkWRyWIOFEKIAMfyTu1DAgguDYR3dikFHAg=
X-Received: by 2002:a17:903:2985:b0:224:24d3:6103 with SMTP id d9443c01a7336-23abe462f3bmr5850455ad.35.1750955897886;
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHTg5bU2RCynjfPOJov4HiYgc9/oR7gcvFmbmqvfPAlowElQPIS12aIx/PZTAcUpaQOcITUA==
X-Received: by 2002:a17:903:2985:b0:224:24d3:6103 with SMTP id d9443c01a7336-23abe462f3bmr5850115ad.35.1750955897475;
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.255.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe3daf4csm2003995ad.112.2025.06.26.09.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 09:38:17 -0700 (PDT)
Message-ID: <8625ddf5-d362-cffa-efd0-0ada8e547700@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 22:08:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH][next] wifi: ath11k: Make read-only const array svc_id
 static const
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619082010.1834109-1-colin.i.king@gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250619082010.1834109-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685d777a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/xG1ZwzdjF5UbGEDupzz2A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=8b412UgErZc1wa3ZSjAA:9 a=QEXdDO2ut3YA:10 a=LXDWoPVop_EA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: VhjhLKuduTiRpj5dnjgcmHecFmwLgJTA
X-Proofpoint-ORIG-GUID: VhjhLKuduTiRpj5dnjgcmHecFmwLgJTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0MSBTYWx0ZWRfXwgxEJdyO8c/M
 jLw2KoGbAR3DooYBL8G3IsER6+mdsxT2S7YYSo/MsQUE+QZBSJ6aIAuSXli9zBimTAYPopjhee6
 hlHPNpkvDbkF8YtQoUFjBFJ5xCmnybXS2xoGK93G05jJ1+aF591YTJhZ0nu6O7JPPWbIq9TbEG7
 s8cEIK6ssmc3sqwkzFhd4QzSAQ7xLp/Fp+/gZzzWuLx5xL3c4m2WoU+G39up23vZQ7QzFIFzb5y
 kCSM/cUaTHtR2wxCXR7Wwcyky5jZV4ov9C2JoYPy/p6P5+7ojtlEZGKd15cjT+R2GArnydleoux
 KfTRGjNWg0lLkcd+MiNVOGj/ktgceyrPlGCXY1iB80gF/ufJloFxLuybd8Gzc5qjs4GvwQu//fr
 H7D1mENojctYQOo0Ms85S1iUF8hu7xpgELXqK96n44H/q2L9jE8VxeCGeJXQ6YTHsTPLhpPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=820
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_093820_478345_56F0C919 
X-CRM114-Status: UNSURE (   6.97  )
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



On 6/19/2025 1:50 PM, Colin Ian King wrote:
> Don't populate the read-only array svc_id on the stack at run time,
> instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

