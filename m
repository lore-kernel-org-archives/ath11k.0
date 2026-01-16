Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C003FD4A5E6
	for <ath11k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pInbWTsP4EKynCkZ4ua4GCkDrJVRCSkgQMRc4Ub5/0w=; b=Wqc6rBYoAhg3Av/6vcXr2jJ0Wn
	EDal3t6xIMvH4Q4Ws3B7wQ4y8rqbu1qlwUNeZlKybulQ85ZWOu/1ploK/tir29OR1sgBPC6VW87jT
	iDbX/TX/QK5YMrrlj2Wpiv1nVfZ0cD/t9GaMXcCl4aWj6/3EgFz4euvFo48GyeJR8rlsaG0bad2Ar
	pZKcK9WQ9kh7lloaZ7xHXwQPxrHO4MhwFZ1E8xC04Lu67CfmQhNwF9U4Jl5nlt1Psa7/0pgPzlsnh
	ovB8EADj4m3aiJZ14C2+5g6e79z5P6CIyXQ76tXtKWr884VFZ2d3ahSWLqQP4DmKY6cvuwGt26kyo
	HOZlC9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcH-0000000DQ2C-0YV7;
	Fri, 16 Jan 2026 01:27:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcF-0000000DQ1C-0hOE
	for ath11k@bombadil.infradead.org;
	Fri, 16 Jan 2026 01:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pInbWTsP4EKynCkZ4ua4GCkDrJVRCSkgQMRc4Ub5/0w=; b=AU/fPYaPkcvhtnU2siCB0OJuMx
	pDsCJ8dP+GWkG2PtzhzOjrW/oanNMoIZOhNyDi9Mk167gPzLl2zPDczBGCOYCUuyKUWDocHdLHR6h
	LVoAtS458ZM5XYdqn1AnS2arIlwyNP3aTPjtV2ZpmX6w7XQAXlVCLxbSyMKmlRpb11Nl9tuVvBVCF
	xDKFJfPU57TBbdlc6sH/Wor+sei67H0yw5Zv4HCZ2OrkP5kMj6UwoaKI6lmF0ilO50uW0DAK3DK50
	MR2kII2N4FksmM52qWBv11dukqVJcfu+HGhIXdKmm4FDsjXbTv0rVzAFlK2v0prdpsu8/BK3xEXj3
	8pbSfzcA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYc5-00000007tYD-00XB
	for ath11k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMcm2p4100795
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pInbWTsP4EKynCkZ4ua4GCkDrJVRCSkgQMRc4Ub5/0w=; b=WHXo+u3sFj+6MFln
	Ack01R+prYlZYoqf7466SiGuXU8rQZZ4KqMKuwtIFh0doeDGv5WmTTPgrR20Ohlv
	Ia85CLSzD5ZawSlZHB57DwjQY/ClzaPILUiAysuPAXR20Q87l53FrWI3SZ6Aie2A
	juJ7pyQJNDrbDiq3/irEtDfM8/Q40PfiQA4h5D70JiaxBNqYxhzi4OzNZwmKIhc4
	kuWyIsJQaD2mDfjqESyl4FyEof0hDr44vrCO/QgRmMXxub8aNzZpx2BAYZfkhkG7
	a5EuTL1fYHbIgEBUZuxJk5MCsA6E/hZxqA4s5u/GKQ8RLJBzoQTjeq0x6BdpfkN5
	3ZBlbg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9750au5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0531e07e3so1730730eec.1
        for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526813; x=1769131613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pInbWTsP4EKynCkZ4ua4GCkDrJVRCSkgQMRc4Ub5/0w=;
        b=a4JOEnPwF6EbWwEtEGSDG7wiSDqRIimk0lIaX/u7MfVUiuluOnOCrMdtwf+9YgJ+nV
         YDAn8Mm74wNYo+Ks9tbQgeveQZyqeWW6LYZroAJqIHnGEP+yqU4NwOgHZi9+0EqfLAuR
         RRp4lex1x1eXk/e6rtpGYAT3jUPHFLgjVi5NI+zVOQCB8p41S2dHk4ZVkaSBh07fJAgV
         ygtSa6X2ufamg+gvoKfa7BoKQu2hSaybChXaVXuElL8xCbHjvP6esPj5HySxuBCI2jYR
         BjmD/RwpUSUSGq/ueVpdVsgxT96w/RxNupDzgkxWt4hxNqYoEdeaARroostlYYxfpBvU
         M0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526813; x=1769131613;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pInbWTsP4EKynCkZ4ua4GCkDrJVRCSkgQMRc4Ub5/0w=;
        b=SeiPqVgHjPPZhrRARBDDtBGTIyoJF0bNucpF7+PI83I13fZV6aHKJ0Uc/jDZW2S4+T
         /1nKdySefAEnNzUmqhjHwYbADKNTPMMDjVkARiqhZcJgy1fIfm1KUeaeGm2JHhaAaruQ
         t3pj8Bj3bcCOJrZ7Zco4YEFzj9kcgPuXhi5873x+UDlMUGcocHPFp5AoD9fB72eK7hxU
         Td5ZVHtr1VNt7Rl7rpKZjskQinYiPiCPjRk/tW4GudgYTvU68RyPTSbGQSa/oh07CHR1
         Bt4fKEiBHoxHTXPnFfKIH8Fgd71/9a1DHiQW7Y9snQ8evmzJF6d/B0zcSQH/ak/0t9ur
         I/3A==
X-Gm-Message-State: AOJu0YxUrJzmp07Bo5ymkrTtRlAfZt6RSWuGouqzzeHDYA54uPlhOURL
	hA3OrCmZpzUv2HOPvjh+KRdTv9Zb+kRomh0REGS5yYPfeMj+c9qRo4uvVAPahlJ2tlymjSvib7E
	BrjbiqH1d+TTJyd2oqEhebAAuu1PS8J7cdRTvHpr4GNdjBfQe7Op5mfhM8miaypi3
X-Gm-Gg: AY/fxX6ZOkp5TmErsA4RSgt9Ibqvz+WCxBtmTNZxfiSOAO+WyMnGCq5j5p3lScrUZCw
	2Nuf1sEuIybTB5kZHbcQ9k9QlV0KMM8yI4yYSTq1eUNRASHvSdKAhwu3Xu/v+nUW4EUKdZa4n8O
	iC5rPsfgqCEh/r0nvu/t6QO+w/QV15jtprGb/3i/Np74PrDFUOYHL3rrDJCeoPJjGAXjxghn4ZR
	8XCGAtKHEUPd3MA57zzaOVLMePs81AdZnLU2kpB1hjg54e8j/L5yJZ+tMjvPhgdrQbjydLLtxTV
	DcYsGNCt8Oi+pz3XnH0+Py22cpztFJ18bWGtllj3HbOwmWD6imbsNCz/tpLp8iOidqBmURHZ1Gv
	WuqhqUvNdpxHtuf/zk1i2cq4EUKxAyjMEoNNYkJtaMorB1LG9MxGeiRkflLyVv+4P
X-Received: by 2002:a05:7301:3f16:b0:2ae:55f2:ad57 with SMTP id 5a478bee46e88-2b6b40f01e5mr1237268eec.29.1768526812610;
        Thu, 15 Jan 2026 17:26:52 -0800 (PST)
X-Received: by 2002:a05:7301:3f16:b0:2ae:55f2:ad57 with SMTP id 5a478bee46e88-2b6b40f01e5mr1237253eec.29.1768526812114;
        Thu, 15 Jan 2026 17:26:52 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:51 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Yu Zhang <yu.zhang@oss.qualcomm.com>
In-Reply-To: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
References: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v5 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
Message-Id: <176852681153.1143034.7918446745386883985.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfXwNp2srk5SjlV
 3Bq4Tmg/3az9OfHzaTV32b66CzyQHySr7ji5YP9EEg1MEZNxhUKjLIZAIWkYUL37vzlO58O3eKD
 lP8vo1PvNt5+Tmip15XekMgZ8ZmzXpcrjlEXECyRXdZGDov+pCZCQSfd8BBmLqhNadSzGxlb4VS
 /ovpa9RHJurIxWqkDdp/nPTTLhIdTMrdSrQMj4EmxN34dQe1nPGWgPmvi/vbzJrnghdXhj6TdAZ
 xEB/7fBvbcz05K9iKO0GLAkazRukUpzCZMCPrFzOa/OBVX7k8Wi3Yzsjd/UZM0D4SRqLDTsp3AE
 2SaQOJmWw0DmrHVb1vIa7eOy7ehVHK/AoKJ5JXkPPRaLdTPr9nV5gorNWofLqFwQ3joRjkcDZzz
 OZZrzcpx4JNN8xgZR3UkuQd8pDs2T1K3Z9oiPyVbGVahpuerjJCAlYD2F7zhHC95UUbZL8/Fnpc
 q8H9/fQb3SI9Uf7bfpw==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696993dd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=koAdh5fa1qAw9u3C0PIA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 2YLlZMCbly8U68Cw6WStLrYIlOlPG4xa
X-Proofpoint-ORIG-GUID: 2YLlZMCbly8U68Cw6WStLrYIlOlPG4xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_012659_442669_7001C7D7 
X-CRM114-Status: UNSURE (   6.93  )
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


On Tue, 30 Dec 2025 13:55:14 +0530, Qian Zhang wrote:
> To enable/disable cfr feature use command,
> 
> echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr
> 
> where, val: 0 to disable CFR and 1 to enable CFR.
> 
> To enable CFR capture for associated peers,
> 
> [...]

Applied, thanks!

[1/6] wifi: ath11k: Add initialization and deinitialization sequence for CFR module
      commit: 9b2e3b4ebec7f23a552de4ee6f2e5da8028a2920
[2/6] wifi: ath11k: Register debugfs for CFR configuration
      commit: 9754d4ba4df7e63ab271abb8190008c3a4dfcd26
[3/6] wifi: ath11k: Add support unassociated client CFR
      commit: b3d43d890399e4f49f31d90083bfe9b349cce6dc
[4/6] wifi: ath11k: Register relayfs entries for CFR dump
      commit: c1bf6959dd81949ebcdeef53fbc9bfff91ec241a
[5/6] wifi: ath11k: Register DBR event handler for CFR data
      commit: 99cf756831d203fcdd3f9a8833355fb86611a1f2
[6/6] wifi: ath11k: Register handler for CFR capture event
      commit: ca765beda7084ebad7630bc403bc0b2598d34e98

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


