Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AEECA9EBE
	for <ath11k@archiver.kernel.org>; Fri,  9 Oct 2026 22:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jot2RFAnsnkeM5kfPFj75St8/mCcz8u7h4DuLJdUQdI=; b=3Q1ftALGWSoSuKYuTu79RyXjZH
	Sf5Q3ZKNsbnrdeTe3lEIT0UIxU8T1tWwT4CEzeVOy8kKbFgzu2yXLHMtVZKTUBkS350eJ9hEytw9v
	FzlJ0lvXLIKk9TBi1VUZuBiWJjoH8a9Zj1BJyl2S52iSzLLvQHB9y+NI3TQtcNFsyp+DNmEATs0so
	8M9bnZIMgmed3E5Almk8GW6Obplp3Q72xRy2TLOuCZE3lGWq5VXcrBlYHFoqc8Bwm2Gn0p/Zek+gL
	rQ1+lwcjOY0yiQaafuJLEdXCRv28KPoZ9azMru2zheY8wA2RSJ/xEDQJjs5IvGrXBh10OSxGAQzgs
	eBuzkuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIl4-00000007Gp6-0J9z;
	Fri, 09 Oct 2026 22:08:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIl1-00000007Gog-17Pa
	for ath11k@lists.infradead.org;
	Fri, 09 Oct 2026 22:08:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699KhlVU3274896
	for <ath11k@lists.infradead.org>; Fri, 9 Oct 2026 22:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jot2RFAnsnkeM5kfPFj75St8/mCcz8u7h4DuLJdUQdI=; b=LrikMMDxqlrAhRtJ
	QztnB9LLwVHtvrAZlZq34h0mI910nPUKnbop6irhayiAlj6y7FgUpcFJZpIEvi3A
	oBL9SVqWLyRlgzj3e4HOdajUgTI0Kz1F4Fzgc82S9Vd9Co++SkA6WvAsU8TZTSU5
	yRqN0nEIJIVGmjV+XLuCpZ8WmTyNqT+lvhaAS3zNG8iKq4mk9AXzNqL5I4u55LRx
	E88OM+/gNQqmPsR9A4m7vQVsBXXz+/bTqTIe1o84GPfg4l4iCo5wq8G9YuQfVB//
	K0ujpyfgXiDVXCwRnQovSE1u55vT6/PopMyhZ8XLOpYdWs+K+d4vwMgPGywy4Oui
	dIwwWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7gweh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 09 Oct 2026 22:08:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso309333eec.1
        for <ath11k@lists.infradead.org>; Fri, 09 Oct 2026 15:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791583681; x=1792188481; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jot2RFAnsnkeM5kfPFj75St8/mCcz8u7h4DuLJdUQdI=;
        b=YRmy0AWtnr7jfU/QFCf+WYLsNHwMMuByYlzLkwe8ccGLiXbzhxUpnoHJ8VCyrvYyTJ
         ewoRMCAuJtNgJmrUtvmGokKZuDCFhDUoxdB+yyCA4qhzPGwfkstMs2xawzbT3UYUj3w8
         dvdgCRC7Dnlux/OvtYfriDR7vaSWHcN8LwnEu41QOOnofGNHhP+qmJKdymhooY0FphxA
         ndxJF4lQhH5K5m0wiXZP7pL/ZlR93A8wfahzNHkdVVF5/vsgjgA994uo1fgpImt2JlMr
         nbpLQLy6pUp10EOByQ4oyfHquvY3hTtJYAk20Zm8GQ8NlNJzID8cwhRavcl4WotQ91ry
         X/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791583681; x=1792188481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jot2RFAnsnkeM5kfPFj75St8/mCcz8u7h4DuLJdUQdI=;
        b=fbPf/TKkygq89hXnhBzQfwkRT2UV5rr5alBIfIURj8TvWtQYMbujOEwX6wWL7K2zp6
         bHF6Ac4K8azMRJGUbxohKJMB3EEbDspqTp9lF2xkij8SFnQA4COKd5yrJek7IhEwLLCV
         5rKySBpVaKf4OB8Ns7/F3ukgumMXzM3VbvEpzVNEz2R2Au9qncxyR3SOpsYOg0hR6ZK9
         VWrlLGKeFinzzPcqK1LD8mVUV7TUHvNcNRsvIZqx8CPxu6nglLQ4u+meDWbeMAVDsiDp
         9w0+ZH2gj4vuFdc1IEIWDkt/+hnAgdTpu+4gWeOWenXtL6t2PtwTIffy470y/YV0dTau
         zHyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJn+BWA8IHGeq6soSFKPy1Qn3AR51uO1ElBSsRJdz+V67/cJHiSdhwQqgE5JZCW0yqbvjcApE=@lists.infradead.org
X-Gm-Message-State: AFq9FYIiMcuglJIpzkUlpyTkCRJbilqwHZj8CKJHGdS4i8+MxxpgorgW
	FZWvN682JKGVyokhpEnwVXEu7b7kVn84uIxjcts3manm6h0ZrEqm79jb7vWjgku7yb/sp3yzct/
	BJkSHcK7G87SuvDl43PCDS9TaJkcoL93ORAmavkxeBNKSuU1BsGWEqqFF/qpmyata
X-Gm-Gg: AYBFou0SynO2xSDB34Q+YDr58g2+mDLkvsgLDzZu/W++x4W7s9q+nUtFrOn04BbnMvH
	zVHiu3ZUiTwffR+v06Wd0AYw85UOB2efvzl61V9+V3bWgtjml1ih9jlZHsDWE6N+/oOUBfy5NTT
	AZu/HydCcGtkJiBMb8BsK6GZs7L0gC2mTIiUm20Vy7XveAWSJFXw9y5WnAlAOz6xCtFSpj5B0NZ
	XNpuQxNrLGVo6DPpt/DRobHeHX+1Can/ovNfDx5I11C7wezs8clr1MXzwS3JnhrhrO0v4q+6H7C
	CJ6gNKwbqrQkWmYpKbPYG9IUDWR4kzB+SZT//CPNVUu5Ldveu23OHy98UxVoh1oNiygWdburyEY
	/lqJOCff3ei3VZC5lURb8MYFmXkE/gIz16Y5XQ2jBoEuTiJHDPVPlLtrzuA==
X-Received: by 2002:a05:7300:c7cc:b0:351:7dab:58e4 with SMTP id 5a478bee46e88-3537e134b4dmr4228793eec.32.1791583680309;
        Fri, 09 Oct 2026 15:08:00 -0700 (PDT)
X-Received: by 2002:a05:7300:c7cc:b0:351:7dab:58e4 with SMTP id 5a478bee46e88-3537e134b4dmr4228760eec.32.1791583679655;
        Fri, 09 Oct 2026 15:07:59 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm8860018eec.24.2026.10.09.15.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 15:07:58 -0700 (PDT)
Message-ID: <b96945e6-bebe-480b-80ed-d3343e94f2db@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:07:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: initialize CFR locks before capability
 checks
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Jianhao Xu <jianhao.xu@seu.edu.cn>
References: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ac965c1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=MAiKVQkammv_BUypPwIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: liZHhLXYAMaNkhPR5rtNbFESiCiRXEd9
X-Proofpoint-ORIG-GUID: liZHhLXYAMaNkhPR5rtNbFESiCiRXEd9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA4OCBTYWx0ZWRfX38bTb1rdjvnF
 UjcaPCR0Y2qQiR6f+zDboHqx9jxIkh18Kjy0FrJH9bjh2JvNdOtt3nrPTofIUbFF7l+aweBVaPd
 Vl/FweZe9K9zvqjVplzBU90/NeNYQuM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA4OCBTYWx0ZWRfX6P0ZMtKajZGu
 nbzm6w7xclACpcUcKHvYyTGMFLTiHuOCN020bplTEXjj3IQB2uiZs2VnI2VNzHNqLI2NODmtnmd
 jFiYicMtIAGlMpgUbnums/5fL3d8T17DBQitvkwOPxj5ZfRK0XPDzNMyochm1rgm+APh9cKnTTE
 oh89nrp5XcaISns3vQrdDb7rkYydsHvg6prqrF9Apy33ezL36x2/VUKWvEQv2vmXROhYm03szlJ
 LKJjYwVo/OldqIVvGd7be3nF5OC/pWq8bEzNz7Ok5/T9wIIGV1TLhbSAC/rusjtXaLImTTcKc9w
 a/m0zxkv8ufUd6yg4GjjUqayhz0Oi5UNiCIUJFHYFb4UNJFL/ETf5RFga00bb5qwD5brh6c8cQA
 4+Z+ITiVMK0YTR8vjgUu6mZL3rA0SLEEXLHbKQKoTpvYNa8+rhAUr1gZwgBrWHtw71PkjTJ0ulW
 j0nY/BQQxjtWLB/wePw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_150803_449307_6EB7036D 
X-CRM114-Status: GOOD (  14.50  )
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

On 10/8/2026 11:03 PM, Runyu Xiao wrote:
> ath11k_cfr_init() returns before initializing cfr->lock when CFR
> capability is absent.  However, station removal still calls
> ath11k_cfr_decrement_peer_count(), which unconditionally takes this
> lock.  This leaves a production path using an uninitialized spinlock.

If this is really happening...

> 
> Initialize cfr->lock for every radio before the capability check.  Keep
> the CFR ring and lookup-table lock initialization conditional, since
> those objects are only used after CFR capability setup.

...then this is a poor solution.

And my review agent agreed:

- Initializing the locks unconditionally at the top of ath11k_cfr_init()
before the early-exit check would work mechanically, but it's wrong
semantically — callers should not need to reason about which subset of struct
fields is safe to use at any given time.

It also ruled out:
- Guarding the call site in mac.c with a capability check would duplicate the
firmware/hw-support logic outside cfr.c, and there could be other callers in
the future.
- Moving the locks to ath11k_ar_init() would be over-engineering; cfr->lock
only protects CFR state.

And concluded:

The fix: guard ath11k_cfr_decrement_peer_count() with cfr->enabled

In cfr.c, add an early return at the top of ath11k_cfr_decrement_peer_count():

void ath11k_cfr_decrement_peer_count(struct ath11k *ar,
                                     struct ath11k_sta *arsta)
{
      struct ath11k_cfr *cfr = &ar->cfr;

      if (!cfr->enabled)
              return;

      spin_lock_bh(&cfr->lock);

      if (arsta->cfr_capture.cfr_enable)
              cfr->cfr_enabled_peer_cnt--;

      spin_unlock_bh(&cfr->lock);
}

Why this is the right approach:

- cfr->enabled is set to true only after spin_lock_init(&cfr->lock) succeeds
and the ring allocation succeeds (cfr.c:997). It stays false in all early-exit
paths: the firmware/hardware capability check at line 959, the
ath11k_dbring_get_cap() failure continue at line 970, and the ring alloc
failure at line 991.
- The check is already used analogously at line 937 in the relay flush path,
so it's an established pattern in this file.
- This avoids touching ath11k_cfr_init() or the call site in mac.c, keeping
the fix minimal and localized to the function that has the precondition.

/jeff

