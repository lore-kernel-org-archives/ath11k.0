Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C97C0218A
	for <ath11k@archiver.kernel.org>; Wed, 29 Jan 2025 00:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=033Ruz6Xk8VtjPYFE47BYVz/7jmWnDI3NRw25DafCzo=; b=uCnbXHkluhlu9A4cF9yn+S5uNF
	03iNjurFvngf4OPvOD+OJynfq8zLmutwH8a8Qdqh7AupOxi512clYIWEeFaC1XsOhPiUbktyotD0I
	LBqXwEYXvdrVP7UvuukvB3w8Bc5clE40QDYOlpQI72IQF5KKw4LpzfgDdYpZ+vckvamjTIio7REq0
	3b7T7vmuLmNIhrrstCDe020S208nYVTK0BGMTlk0VJdKJcz5PiCQDsXqsSKXchKkgw5n/Uw27MgGq
	V2dkAvPbOXgoEO9pkBs92L0Pv6Zcy7mzWiEWwIE/2Yt09lGSNnXBo0oFM2BImxokeCLtPwaeGDnT5
	ole9p1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcvdF-000000064DP-1xYs;
	Wed, 29 Jan 2025 00:08:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcvdC-000000064D4-1XW6
	for ath11k@lists.infradead.org;
	Wed, 29 Jan 2025 00:08:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SNrxub013249
	for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 00:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	033Ruz6Xk8VtjPYFE47BYVz/7jmWnDI3NRw25DafCzo=; b=AhvNtyAyrQ2fGvra
	TOqgkdTBHWGIdhtT974EGCsTL+tH4QtZpHSIsRfPn7IrSUtx0SaTX+BCvP2rC9bD
	a1uo/JyoA884mZnahPLLd/2ImLtk+R6gAkDNLcD8gx3+ssE6aIXd0fEKwRGfuaHk
	0Igsf44A+5cA3XSZrtyyLVJO4AAKFafJUhIxhi2mswQ4qp4lDimbiXffBHGyr3g8
	VE1/x7Y7yykOCA9neZzLWLU00k7BSarkVwxj6wYxfKjHw2VMj9QE3D0fURjVgDrN
	Z5O/5qa6mLogQuvvlYKnVt+DYe5P9Yym7xVt4k/uGJdJnVfZLZwb/ttKDB3XRMSI
	mm5+ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f9ah00ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 00:08:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2166a1a5cc4so118205405ad.3
        for <ath11k@lists.infradead.org>; Tue, 28 Jan 2025 16:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738109312; x=1738714112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=033Ruz6Xk8VtjPYFE47BYVz/7jmWnDI3NRw25DafCzo=;
        b=Ted5rwG5HPnwG75xdmH2fi4j65/k/Lrd5LSIYDluNnt0zTfiMM8oWSpRd5DKyNbhFa
         PeoulKfR2qPc4GK7kNAGuof3q01847yPb1L32XUDbqabRo/9/n/5pmPav+5TsZ+Ai+ck
         WQZGyxX9nJrimterXxsBLhDRGnCQHyX7D6m0CPUrZY8thYTEIo5DkNcxHKSvRyXW7+lg
         QWPqieFXdftOwSOTfB+d5CuPr/M447YF7RcBw/LOzcF4eQpBUzeWP2RcLFz3+g5YNeSS
         aHZMfUhS0shpgLxA8XBc4I4YvvFIYTMPhddhvTe5XK6eO3wgWKOtfHEFbxSSYraY4mk3
         QChA==
X-Forwarded-Encrypted: i=1; AJvYcCVgRIUGp1Zrtp8bhWB0vA7zCTm/ox426n6X9e2edp4Z90NRNWHxidC+i3xLkHKxYgu67z+MPC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqeucOilnXSoY0KP/xwX+Lg7/GFFBynWAzFoFoJMVLypdGQS0p
	0eMD1E66EsUpei6F41Ti2vM0qy/K/oGl6RAxoth18V9zVM8YZYy1yuXTU7XWvKlu8ZllpxNi2gK
	oBJGgh2Y03X+f6kZLTLc4zsn4x4G8selZ1M+6UYgi5/81IVPC6XeNDabinJB1
X-Gm-Gg: ASbGncu7XH61CEsFYd4S+mLly2RnzaJ2lQIeR5NocFs15+0AGxOXSjVbw9OD6qkBkuG
	4pYtj7nqxRHCC9vMsrTZRgghIPz9b1RJQ+ghb3jSTz3WPHcBx9RWdIn8h/sZq2mQrWIZUyRB1Cr
	DUkle3pw4UZo3S9on06IOlOZiuHOkM6a6L1wsElB7v1WexM16VndghPafB/NLJjgVyxj7HH5uHm
	j4UO29o1pOZ/wsmMDM1b4ZwHwjY39VjZSG4evLhy0hHn7vsW2uG7E8tQGaTNsstFJXoZiWtDAgP
	nijT8S1szAikRuHlDyanXXnOuNFV1/UAbLj9P0sJfT4LO67SE3BIsojMev13Z7dRoD4G54U3Qw=
	=
X-Received: by 2002:a17:903:1c7:b0:215:6cb2:7877 with SMTP id d9443c01a7336-21dd7c3c5ecmr17798575ad.4.1738109311830;
        Tue, 28 Jan 2025 16:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsMCW+yllDbo55XAp2kTIbQ1pr2fr8i1lRySB+813CdSyCWvnlAZDIokyDUH6qR7AVhf/qvg==
X-Received: by 2002:a17:903:1c7:b0:215:6cb2:7877 with SMTP id d9443c01a7336-21dd7c3c5ecmr17798175ad.4.1738109311430;
        Tue, 28 Jan 2025 16:08:31 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424aee6sm87221725ad.215.2025.01.28.16.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 16:08:31 -0800 (PST)
Message-ID: <dd5d8193-3b35-4eac-b551-4dce5e82c3f9@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 16:08:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: remove peer extra rssi update
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250117181953.3375273-1-nico.escande@gmail.com>
 <d5eda793-c7e9-453f-9dbc-07e5df73c47d@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d5eda793-c7e9-453f-9dbc-07e5df73c47d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7pjsyASoRNZwJpCIesh8bI-aa7P3TkRY
X-Proofpoint-ORIG-GUID: 7pjsyASoRNZwJpCIesh8bI-aa7P3TkRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=972 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_160834_551370_C34F589C 
X-CRM114-Status: GOOD (  10.48  )
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

On 1/28/2025 2:29 PM, Jeff Johnson wrote:
> On 1/17/2025 10:19 AM, Nicolas Escande wrote:
>> Commit b205ce4c266c (ath11k: support avg signal in station dump) added an
> 
> I'll fixup this reference to address the checkpatch error:
> ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'Commit b205ce4c266c ("ath11k: support avg signal in station dump")'
> total: 1 errors, 0 warnings, 0 checks, 8 lines checked
> 
>> extra assignment of arsta->rssi_comb in ath11k_dp_rx_update_peer_stats
>> when it added the average rssi support. So lets keeps only one by removing
>> the legacy assignment so the two statements about rssi stay next to each
>> other. Compile tested only.

I actually made three fixups, please check:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=7946ec554fbea5db9a3aedb7087f0eb9e3749abc

1) commit reference
2) add () to function name
3) lets => let's


