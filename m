Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5911BD2FED2
	for <ath11k@archiver.kernel.org>; Tue, 27 Jan 2026 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=; b=aoHUf4We+3fDHCUq9KCWnE3nDs
	1zHhAHr5/zkgnWuVnKR5rhcn14Mu6EpTuoN//ngW/rTIMhKRJk/8nA/OmwG7/T+45VLlr4RAJCxp6
	N6vhmTy9QE7TKwErdfSBd+fvCLObDeqB+Nbja1uCEEioudvoeeB+U4Nhzk12J9JviI8cD1H52P9vX
	lu6VD5yIDVuu45QnV0rMa19SJinYD9uU5oVJv9BzM+OsrMQdWx1zVZpI/CMgOoDsKdUM4Rq1zUUmk
	ux4GBLy+YEkfh4eWIgMl2MJ77DzypzqVScTr4+Kb++/Qe80XpoihP39ImYjYPWOG0mYdD2OYXwlUC
	BQS+1J5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknvO-0000000EpKE-364I;
	Tue, 27 Jan 2026 18:36:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknvJ-0000000EpIz-2OFr
	for ath11k@lists.infradead.org;
	Tue, 27 Jan 2026 18:36:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH1vau1334272
	for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 18:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ixa2UGNOFQZl7W2RGTX0PTpp
	eOqrnnMpuO5g8Z9i7aM=; b=fcl/VH3HO+yP94XAfGovsWpacnxdbhM9txSHE4yC
	9goskpflG6mtq3dkXu18L2niM28yWp4YfCHMktg3PcvCjYDFlB3r26lykEscqVJS
	+gmwNXcIPSnFe11tvCEMqR9ulpD/f4/kaIJIS/ymZh1EL6tpt3iijR54o1p5NVOx
	4QmwJd3+vZ1rLTxeYk4Yt3jYQuC6G27WjmLU4DRHjuEjxWOC6Zi5XeMhN5mHdF9E
	XzhyRe9VAN6KkyADozZfiTMUvHq9sR7vu3L/ibvhTrK3jWuPyiwGFjGDPOmvLZZs
	moZwT7rD1jRxWYK49qRCh3OWywvBqzngqz4mwhVcphmolg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1dfraym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 18:36:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9413e6717f0so8385786241.1
        for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 10:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769538980; x=1770143780; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=;
        b=PEqFdXA5EnqjTzoBHFv8VP3YPcXNlY5GwcBj12YTEYduilUWB1Cg+QbxCNpC/t/YP/
         dnRBVP59Zrf2gTUNqzBlUSpKxkbKKWmXJYulhdsBhSy07oWHMvAUtk1JyP/ca54CuOk2
         j/kmOI2xTz8+aR9MMuVcJMVRjV/p22uUpELOfpDmK7yvvHFd4aOgV9inK11WrYaHKfTZ
         I8Ob0ej760P9xVxdbbKYu9GHnBvLMxo0v4eUwj1qwc0PPjhDKVgrWrjY3n4d5wYvmSI6
         1JPhP2GB/mfaHftJuCM5wyWu2AN3YBG7VouKLPeTe3Zc2Z9SJ6U9O2jJYS5+oCqKdka0
         LTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538980; x=1770143780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=;
        b=YrIqQNj/Pf1NAuJoQloqkPBylHkvGOS6vWoYXYTxoImxEk/ZNyEl199968Efv9rRk3
         yyHCsc/YA1G1pEOi0ITHT9qlVxP6zaktx3KDij6JCmAAq8bPBVNAgefos9PGPmrgXqB2
         lbArJ9ABczNyPw/pJc+bFHYYZoRN0KlUPiyjgEtN9ghPY2fH1+jE1T5zscSmjyb8t6Dq
         ETlXP41h0rIC5M6E06r48Hc2zKDtjHx+2ktD5elfBujFShoXHdadpdkI2HhBVAJnxvjF
         PEPMo4Y7NPyiawKYEQj55JAZavf01w7APPlfGovqTxG6yNp38kvs9rNK+Hn8Xf7crKgv
         iNrg==
X-Forwarded-Encrypted: i=1; AJvYcCXft5I/a3LVTaGwelwtMXlEgYpK3mcZR9GRiKeDahPW/1Zs/YAVM/11w7C0bMZ7QSlXsxJqyJI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOFqenxdkxzWSwOI23H5us8sJqLmIYoWWaTfQ7BkkvLHcaF1KG
	RZOpALdLOdd8s37BcQln8hYgrtJjFsJK9UmfAAIY0VCVUVYSsnG5LVVosBlGZi/OJ4PzaakScKT
	77JXHKxMOlhBwjH1WDJmPBcsWYXh8bi95Y5EeBbF19hPbOEKSXWToZ48iwKB7ZYQl
X-Gm-Gg: AZuq6aK3wRioYBEyeaGm0qGLpTwR61nwgxuKfeDZ5kEODsyKU+6/zRMsna26ntRSi/1
	7Uh7Wz/paE/5UieD6lrE35HR29STgKcCGMEUf+hj17baKiODmmkFvpbYGBpBFKXC/pJoCHJQtmp
	pTDJoECbw3AD1bhJf4LqjXrrZ1E/qQEoNNj1r9j3MavBRsNUqAj6JovDdlLVEBhHNGE4MmNLyYB
	Qa4N3HNujnpLhe5ldo91qomcqmRpPo+CF/w6nEAWJztCzU0VrLX4j099z5QvnbGOwzfpNt4n6eM
	3VvIqW1P283PCJq7FzOy4daNA8kv9f536+oHRe4JNNa+PqIMuXpJuvjmNprauXBzcSDNwNTO+ll
	K9ka3FSR6aighWySnDepxSKconaq1tQw/5lqtMjJH3b0K0YOXM7Ur696BxM0uYX4QT3sVDYclop
	fDWnAmmDeEMnoTtL2pm6Aaipo=
X-Received: by 2002:a05:6102:a47:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f723817ee1mr912473137.39.1769538979633;
        Tue, 27 Jan 2026 10:36:19 -0800 (PST)
X-Received: by 2002:a05:6102:a47:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f723817ee1mr912467137.39.1769538979095;
        Tue, 27 Jan 2026 10:36:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm98670e87.11.2026.01.27.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:36:18 -0800 (PST)
Date: Tue, 27 Jan 2026 20:36:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260127
Message-ID: <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
References: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1MSBTYWx0ZWRfXygRa9rzl0A/D
 thWr5B9WMvKaiv/wNNnteV+ho/YPOX43jA4fgUDvFa4QpGvYM2VKdhwrLFsr9hozf9Jaqsd43PY
 KproTj2grfMQHpFmX6SE0mTplSgeAimJmoLJ0uZbnm+S5Wlj4KQ5vJ81kYXwNm5BiNL5l+eEL7d
 V2t/+cmExtFJupd7D1uPdFBpLVlNd35EKImM+EfEyiHEIEu1FbtyFFPvrsra2Q2+MGZmoh/tYEs
 YjuBYzJBNz8AANqlyupQbP+gjiKUr2+5rGYSLVKBuRxN6fTcBW6M7iucrpQ6pL7C8JKWCS58U3u
 nBHZmB0YeCOLoPSlNNjVTn2iP5yCy4SxkWHnKilwJmKEgC7nSq2lOHuJtSLxiOy2MMDOkfPluHJ
 0Azr16vpL8U6VTScQlNAAcLQ+yfwtR4g4nBdHPVcqE0D8kkNklgnTHu0nJ6Lxbi4qEAuk3F3j6d
 KU5BcAA2BlmI81THSvw==
X-Proofpoint-GUID: SMresM2j389DIh2hDtXjgL4b5q7q1i9I
X-Proofpoint-ORIG-GUID: SMresM2j389DIh2hDtXjgL4b5q7q1i9I
X-Authority-Analysis: v=2.4 cv=YeuwJgRf c=1 sm=1 tr=0 ts=697905a4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ic6Kjyy2t_iG7cYfer8A:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_103623_796933_CBE7BFDE 
X-CRM114-Status: GOOD (  14.64  )
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

On Tue, Jan 27, 2026 at 10:04:46AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k.
> 
> For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255

Don't we need the variant for this one? Otherwise it's too easy to clash
with another unprogrammed board.

> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
> 
> For ath12k update firmware for QCN9274/hw2.0.
> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
-- 
With best wishes
Dmitry

