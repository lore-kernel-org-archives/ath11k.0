Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34E1C43458
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5rm8mmecnWku+WMvoOW9pOIxP97XIThL4X10qRCnxE=; b=CJMgonoGUqyFeSQ7aqLuyH3IEF
	cm8xFQjYH2c0pxljTr+u61c5gXtKQtSlYR5XB/2mHUYXT0cwKzPSaBIKX7jWCkZLp4HfwWf5Nzslr
	tyon+j9D/6U/UrtdUrxABU7tgWy7FH4kcFicPNOoGQVv2R2C761YFfiFSEC31tJwi876DUfLaTnoc
	YMyAMoUCw6DrX2arl5XFUsR5E10cAer1znlcYCtJL1uqA+gIbo6zf+2rfUpsGUmg5T/YLgN+8gkKm
	Nv+HdEHJswLzWJ84/z3bn6ot02dWRruJP5jtfzidM17uQlGhdtd6V36r+PGp603kOV5YGIatHvOBy
	xr2J7/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJVI-00000009yFc-0Rmv;
	Mon, 13 Jul 2026 16:27:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJVD-00000009yD4-10Hm
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 16:27:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8K4p1860768
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 16:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5rm8mmecnWku+WMvoOW9pOIxP97XIThL4X10qRCnxE=; b=X0KeW06Rfdm3sDZY
	MbtyRXJ3yJfOdc3lYbRUbKZsLN8UiuUw65hnbBs4KB4cfvFDT87bUIRirqTFmGYr
	+eV8KMkm81I2qrBXCTpvMiu9cCR7nd4BQanq+VJXFrKbgPwCOS198Lbk7eNntURM
	9jRvmy4iu7UO9YzsA6iAos77W3ysitm14HkDMr47gt/Cc/SDGU2eLVA95uGCsPYz
	Mur3Q6lmYF3pPSoSTAEDmsoUwt0iMb7FhTNXs3RACCxzEh8mPL0b/fPMz8RPqFPU
	AyLqCVUHJoYS75cb06T+77insB9F6j6FswiLk56t+Lf6c2fu4EzYeG0saOkqpneB
	ihDjxA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj026vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 16:27:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so8616889a12.2
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783960049; x=1784564849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5rm8mmecnWku+WMvoOW9pOIxP97XIThL4X10qRCnxE=;
        b=YWwMNNFMzMSc7AeGJX76orjY9s47QoF1wzGZhVQP6JStwDowb/5O6w1C9djMkvFfVP
         N9tnV2IIyYV44uenBtS3JWiyJrK2yOBsfO9WQmPP9tqTUcbVMAfsw3e2yiPfOfOwHjiX
         NFx3TnmWw/37Dk4gNWhTqzWGKpEC9wFL9AIDzkn9P7ickWcoH3CY0NUUWi4mZGhDJrTn
         fA9C/Efjw4nrxDbpXqle4mZf8zDhjwgNyF/ZHdUyiFhyqYDhtWsC6brHkR3l0DLyQr+3
         7iG+n2o0gfwX9G/whw7LQhQi3yzbmIFER/9/cQ1drmhVxgB4rbz6f5djwLqfF2dcQbpB
         cQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783960049; x=1784564849;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5rm8mmecnWku+WMvoOW9pOIxP97XIThL4X10qRCnxE=;
        b=LzDivJPxHt/Q/84icR6htT5JBxEHoRtCU4poknNnwRjUFNdOFqQTuBJeXN951xgKJS
         9yWpxLY1pQ9FOTtpz81A+Y63bCCfj92Y4/K+CWuKRIMn1PHkFXm5mFaK/w2ALBaimAs/
         YnC2WxXpk8y7tZU1PoUsMBmZO5DySJR6Hf4FXTP9Pm3vxZOZalS7O6MhLbbGKH9f8xRG
         BgTt2kwyxQokWZUbqtAee18v+f9TkHlqfXBNHD3BIxQjGchOduEiAW+oKurBZHty2xkJ
         nufllmX5qqTvyfE1pI4a/eLx0o/OBcc24jT6q8EG+gIN0SZBeKZ82dGmH2tEHmg+bBaG
         ZfYg==
X-Gm-Message-State: AOJu0Yxg4gyB8PEZVgIs3IBYsKDg9RcdIFMaoWhkGrnGyQPjLE0oppla
	/YUqPIuh/1USBWk3Lf6EqeT7IOik68HNydLX2jes8lXVFDO9LcqUefpkC7YgjNPEElN3zNH2vOU
	7R9xypk5g4rWp1hWqN6RC/hZqQmof4yznZ+dqalATzUcDprIECH3RADSmPDrfo3ma
X-Gm-Gg: AfdE7ck0cAsnsThsKR4fn8NlGVAd1Sslg5S3O8Q09Xbem0hO36A8r6skAiiskhor5p3
	4oeJGNupCl4Xuv0NiCSbwHEDosLvhEpdFHzu5NLJyguEElMW59hjDroS9NeBjxTOdY8/tsz+OIk
	YyPRiHRnECt7GbUafCkhFpse2LZzBm8iojLLBANKMKlFpKl9RfCaQTCKqIiVMo38AysFKkqBRuB
	hthN+K0xnpRoFLCL3khKhp2bhFqkP/ZKxvMZXRncKNZm4r8GUeIjhW/VmKydCdTIooTekd4x+AZ
	Dz7GgxMEqUJ6e1pHpYhAd1vFBmIceJvVdeThr5JOrv7k5j4XroV7EBXFhnVo6860DwGFc77P6to
	FA7fEkn1BzjTRQ5kodjdBFjb5ENcIYWwHiRWXpUw94u00S1+1WteY3Xni4bOBFeyA1N1c
X-Received: by 2002:a05:6a21:4593:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c1109e034emr11007105637.26.1783960049213;
        Mon, 13 Jul 2026 09:27:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:4593:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c1109e034emr11007082637.26.1783960048822;
        Mon, 13 Jul 2026 09:27:28 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm28567493eec.29.2026.07.13.09.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:27:27 -0700 (PDT)
Message-ID: <2b5dfc9a-d2fc-4396-a004-4d3dbe30b408@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:27:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710155443.1761760-1-jtornosm@redhat.com>
 <20260710155443.1761760-3-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260710155443.1761760-3-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OSBTYWx0ZWRfX73WFdtb3WvzN
 DuZw/iYaogESjTHfYOGcSJfB4xCm/iczK8/3KLfYqIsPfhcQqWaaBQeO8/z0x94E009ua6uRm2h
 w1Y6l71jIm9t7IIMrJcir17uTswU5wo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OSBTYWx0ZWRfX7AqKqb7qSTcl
 sQpGuCau2SrNIptfMyF9GYts8rdmEptAq5O9A26TdxnHLyEoR2QApP8OzV0gK4c1OSIs1EKYGkO
 2STwjox71RNLi3ok1rO6e5VbSfthkc6U8dnGYOnIzXHlPlXdQ0JRLNmtxRVLsVwCCrPSdPGDhn+
 aUCKxABDBE/0jFbDS0siRC67QfRGuIxEW8SA4dO9ZFrT6ibs4TnGOS8tyWoT+nweafYElZbyW4u
 5qGoHwE7GZy2JDmn0MN2TrO390xd0QU8sJXXODEL+wbrGmWM8OFBx89AdWzdQt3AJ1lQIpJk5nm
 NqxuCLWRvc7v1enT4eFBm6Uah450eE0m881QDY2fcDd91y/75+Rmh4Pr09/dalvLSZWxlwzE1hA
 +bx5jxU+Ukg7guvQtjVdZmjSrCTik23T3dZk95v3fTXPnITIm2CtJe8SomEqD4HKVwLF3mmOCBY
 UHxAbP36HG/zId9V7iA==
X-Proofpoint-ORIG-GUID: hKrvPy0VVsvqsIT6g5gF8NIGHKsBcVOv
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a5511f2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=pXPxGQ70wQjSudtT1GsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: hKrvPy0VVsvqsIT6g5gF8NIGHKsBcVOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_092733_628406_33943245 
X-CRM114-Status: GOOD (  10.60  )
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

On 7/10/2026 8:54 AM, Jose Ignacio Tornos Martinez wrote:
> Under heavy traffic, ath12k can hang and experiences -ENOMEM errors
> ("failed to transmit frame -12") when the hardware TCL ring fills up.
> This issue is more commonly observed in VMs with PCIe passthrough but
> also occurs on bare metal systems.
> 
> Implement a custom wake_tx_queue operation that:
> 
> 1. Checks hardware ring space before dequeuing packets from mac80211
> 2. Uses per-packet locking to serialize ring access and prevent races
> 3. Syncs with hardware state to get accurate free slot count
> 4. Returns early during firmware crash in the same way as other tx paths
> 
> This approach follows the pattern used in the iwlwifi driver, adapted
> for ath12k's hardware ring architecture.
> 
> This prevents hangs, eliminates -ENOMEM errors, and improves throughput
> by optimizing resource usage and preventing unnecessary packet drops.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Just based upon the description I doubt this will be accepted. The ath12k
datapath team is striving to have a lockless fastpath, so adding new locks is
problematic. I've BCC'ed the internal developers list so that the team knows
to give more constructive feedback.

/jeff

