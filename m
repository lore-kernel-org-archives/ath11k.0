Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F264CF64B1
	for <ath11k@archiver.kernel.org>; Sat, 22 Nov 2025 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RD2ZyZ2uXfQhNzRr2Jzkx26Vt8bPaSsVD2Beg2JUtE=; b=lmp8FTaxoxD9oZ03+kpDrosCjN
	4nOfqjkz/MveoGtHZlh4WpFHjGgIjQVaB/yEMQdf3GGNccenyKFF0OEmtOIf21AgFDUvEmSqbc9tK
	Bn0CDamuOcB3+Vyf/aQr4r0JHdTh+mjFC1EfRQUGaKmBoH1biWHhxoF8i5dETZEK6/sITPjMue/uN
	PaTM3GT2FxvGnvZW62Vk6/j1uzva7CmW7JpYO1FidkFR6qp3i+w3gzudxcPTdxIXt0OmKBMsPOCIx
	ZQLb4QtASjurLOmUGQPIWIuypc7MixD5h/F7E21KNfNjmLleqE8k3YpqKfTOmfIKj1QwxuanbMWgu
	QQylnkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMiSn-00000009MUC-2iuT;
	Sat, 22 Nov 2025 07:55:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMiSl-00000009MTr-1L2Y
	for ath11k@lists.infradead.org;
	Sat, 22 Nov 2025 07:55:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM5HgBX2004753
	for <ath11k@lists.infradead.org>; Sat, 22 Nov 2025 07:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RD2ZyZ2uXfQhNzRr2Jzkx26Vt8bPaSsVD2Beg2JUtE=; b=hVxmHiNlni4mT4rp
	ICRhMFlYhSqXba/XGCSYET4NUXFDzYCelDnY2EFSsjfD7vdYXx7OFmtjsNfxybN+
	P/mAMlbgHG5FfTgUVLhN0iPbEprJBq235rXSpdSD1Krb3rSHnjgwHZNpwOfkVZsc
	MnKjrCaeJZ7MeZ3KkUmgQX+s/Yv6q7arfLJqNC8cK+CygAO4rvFCQreiEH72D+A2
	aSjQSN9VlaxxDOgAZh8JS9b+x/TidG/mGB4m4xDLqJTWZwmWIvckXp9G9At0x863
	WQtn4oZTmQuUEZUcBD6dEIqjnXQZ7qXekXgWSJ9SrZVy/0COzFM2kFFhfdg81Nqc
	cU9p7w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ff87x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 22 Nov 2025 07:55:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-342701608e2so3084465a91.1
        for <ath11k@lists.infradead.org>; Fri, 21 Nov 2025 23:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763798115; x=1764402915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2RD2ZyZ2uXfQhNzRr2Jzkx26Vt8bPaSsVD2Beg2JUtE=;
        b=LRicTcsG0qut9emLa8repI/CW3me7OebxddZ4DHu5TZkG8SFbsjHHHMvxhlU5AoYXV
         kniQb6F5xUGwA5RtXIsxKTS7s26yFXBrsO3FGMhuAD9oCoD+RYYS8BjJfhos8j/cpWNr
         Q7tpbRRofp3/HegZaELPoujUENvawMOcZqQud6XBnW1V/Of9NBMgzKGxgq8d4Z6uGtqX
         cRY++jwOrFUIo58uS2HbdUy6iYN+iDzzrRGWj3uD99HOxgaQ6e1pF2EQdjJgGPOJzBv8
         8xPBIf3wXW1roTkLMyFgVKn5KRo2aGfiUcHDy4uhQkxtQwxx7RI5tAJeGyldQIQooA/2
         ftCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763798115; x=1764402915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RD2ZyZ2uXfQhNzRr2Jzkx26Vt8bPaSsVD2Beg2JUtE=;
        b=R9ztgw9wOxk6QsvglqNVV4yxguQKTQu9FuWd8cCB431HrbUNyivUkdXxxYNpKb6+1x
         Gc2hc9k+GAG8R1kA0SxGqWUdC4UdT6dsU9lr742Jce723omVwG+89U42ZPGk2wPxExpZ
         q0TKEQ934ybPo5uJBFSNDEFeOjxvHBEYZVCHC+2IE9QbUfONp6hq9LOzGgqimWUrdeC7
         Tz0B5fgygUIuAAtTSfcwzXId7i/VXj/Jz+5We/KJSUko//hlueZmNKkc1Oejx0bzRg6S
         Oa2V6CW8jXcrR0xCDkKRpZ6B3T8OlbQOBoWUzvU9daOgB9j98WykNAcfy6naJonbEDUv
         Z9Mw==
X-Gm-Message-State: AOJu0YySAZJ0NIfx/np/6IY7KTyQ7LCrVpN8/fKAh6k01uUQ3wM4Jgz+
	Sy3OdwhCE76TWFKlcXN9FvcroJqYf0KkxW1JMK9WutIEKvmpAqQF28z4FCl4U5gnqbEIqxKR70C
	/w3Hpe73AD0W89m+d3NqvPiSKwC7jt3+aotrGc94TiKDOZMbttuQ3u21b3rKClcUC
X-Gm-Gg: ASbGnctaAYgMuJ0RBSL4r1gX4Vj6JJmxxlf6t4TEVGs7bsOcHdT0/S3ATjahNLyGKH2
	1iQFh8EC0XobO8gBDXC85pJmruBpKYQ2qaA6nVSUB/uAgOVu8Y7Y7tmUfsNlsPqeJPkoQ/e3mca
	Ik4BEF6FkvJusIH1vOirTbWlmMYNoPA0Y/xE1KuaQfQD3B/ismtzleGJwkQfhjpmpPyC90UvdaN
	/7PthKYSlwLYUnFv73WZsdu+6+5sTBkhmsftCB+zQtdLk0NbREP4c/v1QkT196zFi4CO9fwdOO5
	pP54xShO8cIlBrqe3IFLNDxIeIeLA9B73sP8ibHXxyqzsiLq0ryChnRjoSg8UlSTKyTPZB62AyQ
	QnZjaxNH64OUwC87KMifAOhA5u/XNwmRI6t00DIktyMLD64kdgjmqsaUzUuR9ZXFjrOrpFou2i3
	3A
X-Received: by 2002:a17:903:1aec:b0:297:e252:9e50 with SMTP id d9443c01a7336-29b6bf5daffmr65072465ad.42.1763798115076;
        Fri, 21 Nov 2025 23:55:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRs9bRWrH/OoYHItewF5ZOfSV4YMZWHn9fAM2sQIhPxQ1m4GC0AqeSRMQ+4cpwyXcnqCbdbA==
X-Received: by 2002:a17:903:1aec:b0:297:e252:9e50 with SMTP id d9443c01a7336-29b6bf5daffmr65072225ad.42.1763798114604;
        Fri, 21 Nov 2025 23:55:14 -0800 (PST)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111e01sm76424885ad.7.2025.11.21.23.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 23:55:14 -0800 (PST)
Message-ID: <35c554a3-efdd-425c-ac34-858a927bbe15@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 15:55:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
To: =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        quic_yuzha@quicinc.com
References: <3f355c8a-5bf2-4a74-9b35-daa8ae479736@oss.qualcomm.com>
 <CAKEyCaD4=qeQZYYOv4BTrqUJkZa+jnea1b3BL434X1iGMA-_xg@mail.gmail.com>
Content-Language: en-US
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <CAKEyCaD4=qeQZYYOv4BTrqUJkZa+jnea1b3BL434X1iGMA-_xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a3ac1tiFjkVUPqhemSt9jJf3fBFwFr0O
X-Proofpoint-ORIG-GUID: a3ac1tiFjkVUPqhemSt9jJf3fBFwFr0O
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=69216c64 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=F-1DhEWBYv2ISTzAllIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDA2MCBTYWx0ZWRfX6CrPd5vfw5hL
 drS96byTThYqXiraccaK1LexIrCjWPqWHyGkzCWFzYo1fjqhx94dkaSDjc5+4pUdWNNqqXnjrc9
 Bi9HxiyD/i1dNAHdeXp+mdLOngfk620VzLn8fA+I6q0d4wEdomUgkB9o80xAiihXJx989Osfg26
 e4uTLdwYLnIN+Xc11GFSvYHEveAmn+dmmp1CKkP4QKNT6gAVQ4znkv4pXbaB7OKAoajDSghnxw2
 4hFB0b7n4ZLsWC3oZQyDx30accNYtxpTZ1zvX27suqsIfDkiDYdgYLkHehHApQHkKsQGQzTRG8u
 hox0msSu5HIxl9CxVKHZ54CdL7cV1DUOdMw6ycIhs7vA7y3bZ3/vlXAXyqpkvkdAw2fBLQRfJjO
 3uUjQg3Sn10kZZwSjmd5qZa7/d9CVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_235519_482162_FD63D238 
X-CRM114-Status: GOOD (  13.29  )
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



On 11/21/2025 4:41 PM, Paweł Owoc wrote:
> On Fri, Nov 21, 2025 at 6:00 AM Yu Zhang(Yuriy)
> <yu.zhang@oss.qualcomm.com> wrote:
>>
>> hi,
>>
>>   From your log/calltrace, I didn’t see any errors related to MU EDCA;
>> what I saw were related to SMPS. Did you also add changes related to SMPS?
>>
>> Yuriy
> 
> Hi Yuriy,
> 
> Thanks for your reply. The ath11k driver is version 6.14.12.
> Everything works if I remove the mu_edca setting without any other changes.
> 
> The problem doesn't occur with the newer IPQ8074 firmware, version 2.12-01460,
> which hasn't been publicly released.

So the newer IPQ8074 firmware fixed this issue, great.

> 
> More details: https://github.com/openwrt/openwrt/issues/20702
> 
> Regards,


