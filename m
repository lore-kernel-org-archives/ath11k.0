Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A39DC5AD49
	for <ath11k@archiver.kernel.org>; Fri,  6 Jun 2025 23:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PBNYpHpthyOUGGJ7lE8j0pFLOw80CFSTRyI4+cBOZM=; b=CBpv9FfGWdSa5WKQJ6VAdN1n7C
	0jRHV6yAs8dkNntzSh4udYsXdLRJhvXfTXlD3YC32msUserpx3iEo7Qf2q4P70x/LGAob9P9BJONZ
	4lWd9aUPOIokPYziFzrtN+4qkRxHc/VCMTaKGznM4YUNXlj4rSh6jEEhGVMZDZyygMs6fneeZUxGr
	3Pd/PnXbGkrjKfkt8Ks/03i/yffF/0TitJe115DUXHB9MNTCG3yeYg630sfpLYmgd7ix+/Hw4r2FM
	VN6iv9lS6lSTuxHgqfB3CPRXnuD3r8brVtFHk2yXbh4rqfZFMtLQ7xWvoBA0Iew8CWm2dj9IrTEUD
	k9L9mVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNg30-000000016Fk-1GnE;
	Fri, 06 Jun 2025 23:00:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNg2x-000000016FI-2ePj
	for ath11k@lists.infradead.org;
	Fri, 06 Jun 2025 23:00:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9OFl024436
	for <ath11k@lists.infradead.org>; Fri, 6 Jun 2025 23:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PBNYpHpthyOUGGJ7lE8j0pFLOw80CFSTRyI4+cBOZM=; b=C87jzYaHFcEngeXk
	fxYpRw2OIm/NLupmcHm+sYVQP5a2BY6WgJjUmOnQhkovGKrW20+HarNM2cmTiMGJ
	3+9kEHp5dfGaPJaLToDTAnyLvuy/l+9rYWSdwuqBlY0xFx5q3tR47eMVJ7d7gnAj
	xO8W5t2/fI4voxjILZ8mwGe8E4/6ppaL8XT4CZT4kQ9PlxLgmMV26Wv8NLACGlT8
	Xqrzzg8OFsl/RSconSY5g7BBqpyWW2qksiLqrI0mE87mm9R9tfGnX6P3hOd/mqCA
	eW/mf3Iew62neu8T0pwryRUHhEuhtgzvPgVJILc298KdFGDm2wHC2u0Y4Lnmr5GL
	MJQlgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv4tkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 06 Jun 2025 23:00:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2354ba59eb6so37813645ad.1
        for <ath11k@lists.infradead.org>; Fri, 06 Jun 2025 16:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749250821; x=1749855621;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PBNYpHpthyOUGGJ7lE8j0pFLOw80CFSTRyI4+cBOZM=;
        b=TEgBrAi1/Qf5Zyv4LmsL3Ok8ZLRY+ytiMtdb72n+SYnu8zZmeeF26M8WDoQdNnChCL
         RMiuMLH1XNYmtqIeLHMcfG2ddY7D48VU7eGMPaoKvbOj37jd8GIrOrUz34MEPBfVvDLD
         4Bq2Xg6fTg7cgcvrvEbVIQt50Mv1MeC1J5iRymR1gONruAiMWUKQEQgokhTDAR5qmWVp
         DsYI1GaMbFEqouzEWIuwaeWapRfj6I5RjiFBwxpp9AOFG3sDxo2mtftgz3r07zfkPFsE
         LtLUrUa/3qKmSu9FiJNr+4fPZnzXWQX6bns9nMYIaGRRYqouKbbSmCOn/FbeP/IlMnAD
         R4UA==
X-Forwarded-Encrypted: i=1; AJvYcCUqgRc9s2lOogoZd9MlNZ8W1+Q71SMwqS/EnTMZPpaPXRQLX5isonnPhujr3IavPgPGqptzcyY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj4YweRo2Y/cMuO9lvoBhlU2xJQAFFKUFVzXWfe05hn1M6jQlk
	/j0WL9afiEQIQCDoao0iZidG8OAr1sVvztuQ6Xo5mquB34bUsmX30f4dCQxqibnaMyvJSy18xy5
	UgKxjlOoJ7lS1ZnmrYkxgryWAGQxuapfXpr0pDHCbINLai4guqYF2vAtl4gRO6VVr
X-Gm-Gg: ASbGncsHCZWfbriSmv2bYCL44V9/KEulMuDy52HCSAdM2g1A4OCQUepu2A6B+OYx3ZR
	dRwAbNXtY0R6WzLkpRJa8KEeOP0zw+l7aSL4tTSeDfkA5+GizqvZvprbQek5T0olr9FKd4pnmDn
	lNGFmIsnEh9dG1WNzcC6G8iePFnzXpu3G93O6J/8gI0okxwhBcq7SKXXzc6aokGATHB4sxV/EGw
	fBCvfbKSIgGZxA3jK21O2gmBK6X9sscNhyi26QXHnKiB3dNVovo4O0ufYFaaG6jXcfCD2QPMgIa
	egH20JJhyQCY8FPkUr08kalhY7f/QnETexF5P450hmZ7bVBsNCT4Dpx8DpxDUxXLJRhJpVyPX7G
	7al82mjEdj9y25wQ=
X-Received: by 2002:a17:903:986:b0:235:ecf2:393 with SMTP id d9443c01a7336-23601da7bfamr70694905ad.53.1749250820989;
        Fri, 06 Jun 2025 16:00:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEJZ+s/3QhqXDs1c/0gIYCAZvR8FCRt2sIzp2/qhB1y/M0rzJJcy3nU24F4cd7HneWwFuq7A==
X-Received: by 2002:a17:903:986:b0:235:ecf2:393 with SMTP id d9443c01a7336-23601da7bfamr70693935ad.53.1749250819766;
        Fri, 06 Jun 2025 16:00:19 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee6eb96sm1668224a12.17.2025.06.06.16.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 16:00:19 -0700 (PDT)
Message-ID: <2b56c510-2e49-451d-bb50-d96ce3aacff1@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 16:00:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
To: Johan Hovold <johan@kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        johan+linaro@kernel.org
References: <20250317072036.2066518-1-quic_miaoqing@quicinc.com>
 <20250317072036.2066518-3-quic_miaoqing@quicinc.com>
 <Z907FGWBV_MNlTcE@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z907FGWBV_MNlTcE@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68437306 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=COk6AnOGAAAA:8 a=zvfRP35NZ5SxQhbWGWEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UC7bigqFCHIPCKeljRs1-fcN2rDvYZ8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE5MiBTYWx0ZWRfXwNerhPVQq5HX
 PSVbyT++Fiy+i6RXxenEAvEDr5epRR67i7WIeqsaK5MjAUhXFZU8I96gE62AMtlpA7GVV51G/xH
 r9Nj39WWvR1jYBCi1SCoHBUvYU8WDdrqWFd3K/sUOVsCjqztessB6+Kdfrvpk0D1RQ9VJbrcrtM
 LlajYGRA2DPfr3Kcs+ekW/Rde0XfAbJs6yqyGO3iBNihoyhaB7CggokV+N4QiLfm1UoA3DT+Pqv
 X/cXewuG1KJebel8+DuNaUNUMuT3+gA6Zn8RmiJ0JTLkeNclaGdVeL1/eAgybXIQNO/FRzBwZBR
 PHHym3sbQ2LSsqj6lIEE6wKrupBEhDzrj0zVg5P7/GuLymCstjCSw45On2ri1XCcu/CtoUdIXuo
 UoCTr+k4B/fWNeB7AOdxL3/0ed0oItSkhAucWOF+NjlvwhffIwozSxQ4evjYJBvn9Wy+24yB
X-Proofpoint-GUID: UC7bigqFCHIPCKeljRs1-fcN2rDvYZ8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_160023_800917_83F07B80 
X-CRM114-Status: GOOD (  31.34  )
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

On 3/21/2025 3:10 AM, Johan Hovold wrote:
> On Mon, Mar 17, 2025 at 03:20:36PM +0800, Miaoqing Pan wrote:
>> A relatively unusual race condition occurs between host software
>> and hardware, where the host sees the updated destination ring head
>> pointer before the hardware updates the corresponding descriptor.
>> When this situation occurs, the length of the descriptor returns 0.
>>
>> The current error handling method is to increment descriptor tail
>> pointer by 1, but 'sw_index' is not updated, causing descriptor and
>> skb to not correspond one-to-one, resulting in the following error:
>>
>> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
>> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
>>
>> To address this problem and work around the broken hardware,
>> temporarily skip processing the current descriptor and handle it
>> again next time. Also, skip updating the length field of the
>> descriptor when it is 0, because there's a racing update, may
>> never see the updated length.
>>
>> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>>
>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> As I've argued elsewhere, I think this should be fixed by adding the
> missing memory barrier which is needed to prevent ordering issues like
> this on aarch64:
> 
> 	https://lore.kernel.org/lkml/Z90yyrZcORhJJgNU@hovoldconsulting.com/
> 
> The fact that this alone does not seem to be sufficient to address the
> issue on qcs615 (and qcs8300) suggests that there are further issues
> with these platforms that need to be properly understood before adding
> workarounds in one place in one driver.
> 
> I've just posted my fix, a version of which users have been running now
> for a week without hitting the corruption (that some used to hit
> multiple times a daily), here:
> 
> 	https://lore.kernel.org/lkml/20250321094916.19098-1-johan+linaro@kernel.org/
> 
>> @@ -387,18 +387,26 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
>>  
>>  	ath11k_hal_srng_access_begin(ab, srng);
>>  
>> -	desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
>> +	desc = ath11k_hal_srng_dst_peek(ab, srng);
>>  	if (!desc) {
>>  		ret = -EIO;
>>  		goto err;
>>  	}
>>  
>>  	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
>> -	if (*nbytes == 0) {
>> +	if (unlikely(*nbytes == 0)) {
>> +		/* A relatively unusual race condition occurs between host
>> +		 * software and hardware, where the host sees the updated
>> +		 * destination ring head pointer before the hardware updates
>> +		 * the corresponding descriptor. Temporarily skip processing
>> +		 * the current descriptor and handle it again next time.
>> +		 */
>>  		ret = -EIO;
>>  		goto err;
> 
> Your tests suggested that you always see the correct length the next
> time you process the ring buffer, but AFAICT that is not guaranteed to
> happen (i.e. if you hit this on the last transfer).

I'm going to mark this as Deferred in patchwork.
Let's have Johan's complete set of barrier changes land both in ath11k and
ath12k, and then re-evaluate the need for your workaround after that.

/jeff

