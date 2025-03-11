Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C35C282EC
	for <ath11k@archiver.kernel.org>; Tue, 11 Mar 2025 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6S5ygg+RCYgkDd953aVyRkTurt13EX9y7F3QCMrgVgc=; b=lQCi1xDCop5qytlIlfFdH/G4ky
	qI++AciEld6rAMbRXeH1NyTNcv0+EHXzWX/M6DSF7Gay1MSehMYiQMPBsRVqKjkPy1F7vBKOqh76s
	5uhZJPR3TZZUkNuB0iuWUup+tKsmUBurdcdrUSiSodbqX5YvFU/0waRmF/XgqB56SZHb0l4aYTOvJ
	nYVXtgACAX6ePYrnPB9q/hwl3ENVHwyeCOITjvf/B01UYuLpiDpJR/n/xWws96yyahZ27oCIgFUtW
	5T3xHrBAS9HWWUdHBnKEY79OgSGb6l5rySTWLTVgpMBrkbqAYhw992wm4BZawRnFOlNuR3Ehn+RB5
	yCwv23aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1Qn-000000067Qy-2JQ0;
	Tue, 11 Mar 2025 15:22:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1PK-0000000679y-00gk
	for ath11k@lists.infradead.org;
	Tue, 11 Mar 2025 15:20:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7jSi3022356
	for <ath11k@lists.infradead.org>; Tue, 11 Mar 2025 15:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6S5ygg+RCYgkDd953aVyRkTurt13EX9y7F3QCMrgVgc=; b=GbHtfjoQB8/5XvFF
	odcnZMfVHt9SVzgJg/4yZpWld8MBehRt5ngEDpzvqPbdvBVv0FasRnsUNlt7DAEj
	Bq9QWng0NYKs1Zq6UfnJfZN8L6lKXpibvCmDJQg3Ak9t7vDwMh9/p+z+g1oGZxFU
	3+U5hXKvq3eGcIn9BKRPJkBUsL34ZZWhSqchlXo+e5bf6KO0dLU0F1Jy16FHZqab
	HwYtuK/AxSfHTrnLMbOLPx5UuYky3AtcTQNA8aN0EW+qsIaXFjw3MKtTk/dCgZDX
	uqRcyOOguS42t6cdUaL/78FJ6SH/feS2H0/fTGJFgALxT1zA1H37K89XbKhcaziI
	5xBHXw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyuh2f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 11 Mar 2025 15:20:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225107fbdc7so56758555ad.0
        for <ath11k@lists.infradead.org>; Tue, 11 Mar 2025 08:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706435; x=1742311235;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S5ygg+RCYgkDd953aVyRkTurt13EX9y7F3QCMrgVgc=;
        b=TjUkZmaHMKSSMm4E8ZUAnQUJHN+yn0ujjLknsXv0Whagw0ZLXITayir7Iy+MiMYOjh
         3cGRE71bh1PALfwztkop8+rsCUESrS4Ptxsx2FKQRxdxAQyu5K2/Khuwvvm36o05K7Tp
         ldrZz4Yv9jELRNeM4ot94I6b5OcGRZfNH4ne86rrCqnjYZhh6mOWy4pqLtnVsx3Qky3r
         Axqe5afaMK0GB/aGcEr7F7YLa9s5W+pBC4jNohSvtaYkst1OT3jZIp2pRElpVwSTV3ss
         CUoxbqMI8bGmusynfr0wiMLHFyOUuMvCbozslwkoxSBgsuld1pjveMjy8tfmD4xP9ipv
         D1LA==
X-Gm-Message-State: AOJu0YwAME3U56NhfrewC64cKTQVq/4BR2Vv5mq4hqffy/tgTlqqrGJw
	os4tpLtRRvz/BonKK0iozZ/RKvLqGwGNScaOLGk5MEhdsenB/g8tVl4w3AokOPkaecZ15a5Dz1Y
	Tkh+C4kr+6tVXPIMEmoztD9qmfYzfgt7qP9YAgSyfqOb7aZoUCuchX/Vi0RqpA4GzbpQT
X-Gm-Gg: ASbGnctOUG3LCXJAWJMXd7+59D74OHHoBvQ/mNlOscS5Oa3EbFQKm9TeRkEoy/69DVk
	rc0fOt2TWkZlHW8nJeEZ6cay6JklGHYlpZf91OwBmUSQ9lx9cfPdytp0MiUe4wPH3Zy7SO4C2tv
	Ba0C2gRdlyYSCEHbboRmOOd2aPJ5D0ON52R6z3FUIev7PfqW4cDBfTfa73JS7sFVLytr6zC+TiG
	1HL2sMkIJWrOQlqGyp3O1MZDldN0BCiCungUPKU9yAPi1ZKpjBXgVi/+RzHWAOPeZDwKsdPmrfF
	Q7sxth3khkruZryeC6wa+ZMfAb3S51vfvQAFFUyp0jjxuQCgodb7rxGhwkF17EPgemhrF9A=
X-Received: by 2002:a17:902:ccc5:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22428a9d152mr264950365ad.29.1741706434953;
        Tue, 11 Mar 2025 08:20:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO6l35iZWPJ3KWFhVCy19eV0b9mYiGmLSNfasvFshbTZzRkI+5187/fK/CQbEGiBAF6eAu5w==
X-Received: by 2002:a17:902:ccc5:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22428a9d152mr264950025ad.29.1741706434546;
        Tue, 11 Mar 2025 08:20:34 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e816csm99020365ad.54.2025.03.11.08.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 08:20:34 -0700 (PDT)
Message-ID: <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 08:20:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, Johan Hovold <johan@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
 <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
 <Z866cCj8SWyZjCoP@hovoldconsulting.com>
 <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67d054c4 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=uOWRnoLIEoXm2GSVXJgA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: yPCKEIYgSIJsspfYsNteKVMR6zRaq70u
X-Proofpoint-GUID: yPCKEIYgSIJsspfYsNteKVMR6zRaq70u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=835
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_082038_174759_4B6E1D3D 
X-CRM114-Status: GOOD (  13.16  )
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

On 3/11/2025 1:29 AM, Miaoqing Pan wrote:
> On 3/10/2025 6:09 PM, Johan Hovold wrote:
>> I'm still waiting for feedback from one user that can reproduce the
>> ring-buffer corruption very easily, but another user mentioned seeing
>> multiple zero-length descriptor warnings over the weekend when running
>> with this patch:
>>
>> 	ath11k_pci 0006:01:00.0: rxed invalid length (nbytes 0, max 2048)
>>
>> Are there ever any valid reasons for seeing a zero-length descriptor
>> (i.e. unrelated to the race at hand)? IIUC the warning would only be
>> printed when processing such descriptors a second time (i.e. when
>> is_desc_len0 is set).
>>
> 
> That's exactly the logic, only can see the warning in a second time. For 
> the first time, ath12k_ce_completed_recv_next() returns '-EIO'.

That didn't answer Johan's first question:
Are there ever any valid reasons for seeing a zero-length descriptor?

We have an issue that there is a race condition where hardware updates the
pointer before it has filled all the data. The current solution is just to
read the data a second time. But if that second read also occurs before
hardware has updated the data, then the issue isn't fixed.

So should there be some forced delay before we read a second time?
Or should we attempt to read more times?



