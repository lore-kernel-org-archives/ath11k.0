Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A48CCFA1A
	for <ath11k@archiver.kernel.org>; Wed, 12 Nov 2025 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=; b=MuvFIj7PjhCZqadUuqXQZCEyZI
	U747BQ2krXe1JIXQTeXSBnTaUSyDkC4VlT2aNbdAdUWwbgTusa107uxqqOU+NfHTW746ICGKGuvcd
	yP0v6HKlMqWVdZ0Z919Mtq2lRKZsFZjTG5oOsFn7Feif8sRA3stj77V/Di/oHdPZJ72ACK54T/BYQ
	jD5C8pdv0qMRvFGSnzCbOQUbCXUPnOFGL+Fhag2SwVtIOf8H7+tvemNj2Ff+v41fYRRV7PFHJyLrO
	cJO+yNUqhtq1y7BtvD3x74d/sTlIM1ko2yAqNJDI5FT73Sbj6qKMwN7ZWg/N4+dbQ4RNUna/mQtMr
	PtzEicBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCIT-00000008zr9-4BKp;
	Wed, 12 Nov 2025 14:58:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCIR-00000008zpr-3xvU
	for ath11k@lists.infradead.org;
	Wed, 12 Nov 2025 14:58:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACE3K3h1271016
	for <ath11k@lists.infradead.org>; Wed, 12 Nov 2025 14:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=; b=DA9iyE4n3zka01QN
	OUIbgpHWWC9iG4I8kOUZbbUvhgtSBxBsSBJCx/7kBKprUT91XYewhio0qTE7TUDS
	tiMPYsG2UOPLpqOHZAywGnB4VGLq9uFS/RxRYMJOkGcxa18lxGjuQTxTV74fJtJ9
	6vqXeJ/E/TWZCj2pckwiWAvGG/HKn/XYeb15f1FYlfZrXu84aAYzL6S5wWl9t406
	NZSuYzjgmNjdBVzYLXvaoFKUbpZCXAh9Txh5hiwFbuux18W+u2tP6T27QhL+uO5y
	gEexHJEe+6oW3HkRS41icujvflfOWgqoU5XD4f0Y+0cSzLcqH7GDIP1yQ+YOD4mE
	c9DZEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acunm05h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 12 Nov 2025 14:58:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f48e81b8so16263925ad.0
        for <ath11k@lists.infradead.org>; Wed, 12 Nov 2025 06:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762959487; x=1763564287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=;
        b=NWeyIj8F6eC6RGAddsgQa/R7hSAipfs6L1J78WA9jQaG/FPBJ/v6m4ulBSD/PJuGWB
         VfgsnlSmKXTgBXNEMT9iDYFOVog+nPI600TW2ZrHkF/6bnOPFyQN9JYno6cSIDXCEkVh
         PwCEm3dVOj5kGJ7xXOHKhFe9Hm9GmVXwOE+6bM+3xY+QGmw8PCxcI0WuFVpoTnAHYP7o
         qhlRn9KZE7XLCwpVc70lPaYfuhPJz8UG6+OhHgwhvN+XU4KYr5uPblO1S1RESKhcyFfK
         HuQVNIXtpiGLB6bPEoCsO6zKLuaDIFRwgSArSleC0OTvPrOLshEA+SQLnSN3bBJvIR3O
         6Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959487; x=1763564287;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=;
        b=qubXhDOmc1Q2RFSjYd/+kNMtJU7Biod1P3qqM2ge2I8EsVogv8BivbBv3ZXF05Bh/e
         ZEMvYi5Iye8jj1A0ti3shl/n3UFysYRQZmZBabS+9Dw52bIxn7Fwpx9uB6OTQLVrGkpH
         QeUZ6rLl3/YVF431sNNay/WiBYXtZIHhD5Lm6WGBvH0HXiqQK1AfuCYrOKq71JfBwCSS
         2zQjYPieZfYpUw1rtAIi/9GlaAqWTXym4alf471Ipll2GCzEZvX+XafdpyoaoYPGep6u
         hAThQN5evqORB2pYD2Wc3BbPLQW3Zpxp/8UkfSS6UVLFq7f97ovrnXbuxKUn05ABQRw5
         d0gg==
X-Forwarded-Encrypted: i=1; AJvYcCXxFCNzZTJpGZA06CPJ6tzJcnFep6UWb9SQz8/etXnLsGLhLRrIrBCt6rVMkkBP9BHX+ssDbyM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtkniGzI/XZm/l/6sa4ReWhTUVrxN1kor4EABXexLEYltGz87K
	cQaooSy/Y9fRBXLVHkfhr5h/0gd76zJKX1B+9LNCW0B4HkI7I9zJgfpEo1k6NMObyPlsv138uXr
	W9uXGM5AF69aIxaGJkAZZnCSFNiH8SvSZRKiiN2H5igMxos23IU6M/8wGYDc6AFGG
X-Gm-Gg: ASbGncuSQsinjIxf3g18F3WkxaNXuxlHBB6XCKw2haedFe2HSsHaK2ixfqX5FYy0aZV
	hsuqOYpusYzc4gSQMjR/eS3Hkfte8YocrVjvLhy1WtB2f/QgMIyQ3o5ztFShmysezcfz/G6tvB1
	jhfJF832irYJeW4UQoJXDTnxc86GV5UoCho+CXOHIObu0N+sg+lESp/Md1GDLG9wdPJUR9c1o0A
	hhAWPXCKcG/ldflZD/KywwWm03qDXglkTDmeXXbIeFVrb2vPKjQUNmst2xKXXcuC1vVGziQLZpj
	riylhyTZQ77HLOz11iGS/jiz8MF+edmbJmDdF7qrXEfAFlTAqLddDuYf0VfR2TjYKkFTjAd0ykS
	Qr/GCSqJldyd7VuKLBgFmf8qjZ1lRDu5amPghjS7aHmtLaJiTxeSC8bh7Z1U=
X-Received: by 2002:a17:902:da91:b0:297:c079:4c32 with SMTP id d9443c01a7336-298407db038mr93803975ad.11.1762959486783;
        Wed, 12 Nov 2025 06:58:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrpn0fT+xmTQ2KE3jNXQxBgiCrfh9f+Cowdb1Z+6u8BAS8ehhTTnn4URI8fzcTRIFNufHZHQ==
X-Received: by 2002:a17:902:da91:b0:297:c079:4c32 with SMTP id d9443c01a7336-298407db038mr93803555ad.11.1762959486231;
        Wed, 12 Nov 2025 06:58:06 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc10c573b3fsm1834473a12.34.2025.11.12.06.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:58:05 -0800 (PST)
Message-ID: <c18877f0-1b48-466b-aa20-6207661030fe@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 06:58:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-next-20251111
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <15a98cae-0274-45f4-9b8e-be6fa9720884@oss.qualcomm.com>
 <7d445736914f971bfbf89b3480cd6552434eaf7f.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7d445736914f971bfbf89b3480cd6552434eaf7f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMSBTYWx0ZWRfX+LOomfqP1Zyh
 8/3Tyn1Oo56kvDDpHg0gYr6qEoIXgkNmJE+VHjmlR6S9NdK5aNHV/AAp3UkF86MB2DgoYg/R4s9
 ervB1uWkF+t8XSYKvEGLEJRg/9OB8ym1xBs8qOGJzlhOz75/R5OHu0n9xd/IIsF6zKL982ntQtH
 sMSgPq2b22dzaq0VrzpHih8x06xOCg95UXbMgd5RLqNnWtHgKKn8tvBPN/780m+7qEo5tUMO/jW
 kE9SCyat4umcIRp1Do5Iybf7+CNDOWSUodscTsq50iSLAAxmDk1H2dYCOvGGOVOZYFygnzyApEx
 S5wxo6AUVWZJsop1BcAuX4p4no/nK3x+QEt7UNDSv+oWbH50iHpmzTQFUOMGhI/uhnMUCbSVayR
 huSBN8O8ETKThrbETubUKajHnWCf0A==
X-Authority-Analysis: v=2.4 cv=aLv9aL9m c=1 sm=1 tr=0 ts=6914a07f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7SW9FmOQa233CxgTmL4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Hh-sLBZGx0fdZLR0APqM_tmnCDutM5Sl
X-Proofpoint-GUID: Hh-sLBZGx0fdZLR0APqM_tmnCDutM5Sl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_065808_005416_73DFE54D 
X-CRM114-Status: UNSURE (   8.77  )
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

On 11/12/2025 3:51 AM, Johannes Berg wrote:
> On Tue, 2025-11-11 at 09:28 -0800, Jeff Johnson wrote:
>>
>> Once pulled into wireless-next, ath-next will fast-forward, and that
>> will provide the baseline for merging ath12k-ng into ath-next.
> 
> I just sent a PR to net-next with this, so you might want to wait until
> that's merged and I pull net-next back, to have all the current net
> content as well.

Will do, thanks!

/jeff

