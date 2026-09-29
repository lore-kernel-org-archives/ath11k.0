Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CB0C9832A
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=; b=YyVvdOlal3ik3vp7zkJdm+osoI
	qho0X92cM17f7/Q+TKl31pwQs97/NfpRl7TTU5aqcSWqaKPpJch+pCZLKbhv/D1Gtevyn+EUVaZJK
	tM0jLkDuPkDKnZVxg3pB4VdSO4Ypljevonon2FqJqOfvOzLMqM0QbtBzMiyIwqsN6cmucxgTGxtNT
	p/ZMPFwVFjanp/ooT6+DKev+7HyqnkyAFmQsxtwiLhNbGSl9RwXKJ0wVnMXJy4AdjcztwVwoXFGaD
	VfoLp7XuhrlvwQ7SB5D6IVn4L/OZyqTGW8h8/qFCRG+JCjdiqILUdIN3MdrBMIb6eqGUjC21KZM/m
	RuJseRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBa1N-00000003y5q-1Cpl;
	Tue, 29 Sep 2026 15:45:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBa1L-00000003y4u-2H2G
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 15:45:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFG4Be942168
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 15:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=; b=c5p1Xxt8KVBYsUB3
	xYluUR9MR5BVI493p1dU7/qRA7p3Uab0QfpbuGPl4N7oKSR8l/nO6hA2fqIjGBCf
	lvewgeoehd5GZNJK/lICVdtyuyjkIpE4jzq3RvlpAkpahR//80oo7pR5g/ksFoCi
	UGreQx3HnzzIuscV34pdjmOX8gTk6s/0fB2XZQDTg7C4EfXkk4pV0Oo8j5wKQfQg
	576fzBwEUJ3HAeozSCxYT80VGGTz6FzSq81y+kgVCC30AL6SALJ3fNuLVIOXL3ie
	cj3O4c06VkMJUqBJBWT/FSuT1/DbOWAhYasaT3O+s7pFUalgy2oCl180yEf085uH
	FR9wTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftug4ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 15:45:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so4704941a91.0
        for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790696730; x=1791301530; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=;
        b=CsR8MBFw4RzfJVDxTu6gCDvYBux/7FJozafvr76l7JMRGj0epbk0jC4nhnY8aogX5n
         o8m0AkcPNzfWGPWRq8p68vqPDckbVx6xA1qoSfIHeyPy4kgXyWMQPnlTnWUd8iKd9DUx
         CmD98lWPv1mA/hWnlKRi71f6ogVqPtGDfiC03k+JApIodVckhgERK7sflQsMUgpXFL/1
         hIsimfjeZIjSvMl2wBSNpq+08jwD9v5dE5QPXcuH8nBA5F4WC6UzVd9xziQSFJUe8TXA
         Z8X7S6n47bLIVo/QKfEs3ByT/H14G2qm4kGCcfsK8GNIXJTZnc1NveFV8qyUBYjt2bST
         Stcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696730; x=1791301530;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHr/jcEphmriEM1fgwgN6zyuVkI+B+vhIwk8cRw5UGQ=;
        b=er/fmehf24z7h6F/mHVOod6EzVoPRHCsXd24Uw4UL591ihruvqZ5xju2XZwubrQtX1
         A7mc0CbPwHVHd4kjmAX+HqqUa5aslfGh9IfCoDx4FHPZC9q0McsHmr2sycVpxSlHARMK
         FpTO+x8DQndDZszN66MYlJc/yu8zBI1/62zbnDhmi+1BAh1i3lZt/i146pxcfqGA/Nrq
         trQXOXKrRuFAby/Hvq4ZuhubYphzNjJwVwEI+gCYS/Q6oSeM6QdQQtBNke6Kbzx+9kkJ
         kWb2uqMgOov9chzxBa8X/VL5gBMIG8GG8mDjLsj4NZnLCvTx2yw74W+DWaRuTmDXAuFy
         cPYA==
X-Forwarded-Encrypted: i=1; AKwUvBzuaJ4rOxffs1ihUohaOm8J3DTgUfOFcrw9qXydiKyx4avi1KaCj/UM/w8ZmhigmhQGEHKT6bc=@lists.infradead.org
X-Gm-Message-State: AFq9FYI2qboCEI2F58QvRDU73pKmX2V0zsq/RHKRN0cRr9j2zTrEvFyj
	GtYjBovKb+fPNAegc2Y/srfoIxUOc92/rEarb3iEv9El1+LszizhUuZpnQX/wRVC00PUuJd39aP
	KWekJMqRIiz/xlvbfGe2zzjJt+/LHxcWdeUv5wZT8tx2yqaivOc07GXnUBk2zvgPi
X-Gm-Gg: AYBFou0fdyZ86gn8d1xVe+XMQjxQgA0/NpRBw1tacDl9Az49m8OAz3hYwlvJQ1cCBWi
	YV5PyD1m/TKVSg3E+rr8OpSRZwht2ooJSzX3Kbev44oprEV5t99YT57MeRw6uLq996Bji2pAD0X
	uTzKwA/WlbkHm+HqwXnAif8rgI7dQrHo4K9i9zuureneGZf5XSqUpl5hQvVwFOa1Fdu9GzwxSIK
	4V7uMTGROSE6/Ut5px5cHl8bZBp1rnwSmZAyB7QT2egomBTA05tnnDwr82/dk3/nE3pJ3eJfnSJ
	QsBYZ/51wO2jaxy1kCPw6y13khvEQBn0+Tgm57+o7Fue+Y5jFi73ourIEULAkxtU+QGm1QnJzly
	6ut60/LiCY4VrVwvrM11dLnsF767/lvlQqi0z1qiAr5GUtSBhij20lgBQaVL1
X-Received: by 2002:a17:90b:1e47:b0:3a0:c72e:46d2 with SMTP id 98e67ed59e1d1-3a0c72e521fmr11145148a91.6.1790696730275;
        Tue, 29 Sep 2026 08:45:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e47:b0:3a0:c72e:46d2 with SMTP id 98e67ed59e1d1-3a0c72e521fmr11145110a91.6.1790696729652;
        Tue, 29 Sep 2026 08:45:29 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91458e3bsm59366315ad.68.2026.09.29.08.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:45:28 -0700 (PDT)
Message-ID: <fd24a99d-e8f6-492e-a71f-d35188cf41d3@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 08:45:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260929
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfX/TxP23uIEhxf
 Nssz/uGM2Lz9/n33KUKxvsYJVm27j5HqoBdCKhakpV3K0FdCQQ7UjfaMYmQKDQPn8PlIGeL3R32
 OgQHKOxlAn3rl9aDraKrJfpwFMl4RgdnWRzIlUO8S4TYXbNSPBy/wznS1a1kLSILC2hAkPySmll
 01pIpoGJAf9qyMSNr9MnRjDCrOHcGLaHwhwHJZapBhH7WXZJSqMq7LcEi5CiO1HHhCPDvQ6ZnLZ
 anuMd7XnD+v2EdXYdLZrAnrGeOU9aTJ4cbp1Brext8xSnhTP4Fj+G/udMlzu2DmHne0NdmYCQLL
 FTInvsOW/pAZ4sCx+VObMtv7mWz3998XmNioUYbiHHw2Floicv+NAt6Gte4iTeiNKsa75RMneBd
 ZyMuM2sCqXW5ao9QP0MXYtpZkrbeo+S+kr8KsXUSQ0zubNvjWAXhgRAVv8fAlWmk0K6yj0NPYwr
 oVqnxrUuJZqqWWlabJA==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abbdd1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=m8tp9wjG45yvVgdVl1oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfXxi5PjB2A04my
 Q3J2ONLUZB1RyKXaAxwNVV3WY9mJmM50sbNvPNNktDtvBIMTh7ZprEEcD6UJYIoyx+ePtBwfj2a
 RTYOSmBCqokSi9T2J9KhvpQWuJBteW0=
X-Proofpoint-GUID: BTDeuTmtmaBm0KwsrOaVsgrjE2qPWXbX
X-Proofpoint-ORIG-GUID: BTDeuTmtmaBm0KwsrOaVsgrjE2qPWXbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_084531_586389_600C91A4 
X-CRM114-Status: GOOD (  14.10  )
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

On 9/29/2026 7:58 AM, Jeff Johnson wrote:
> The following changes since commit 6f63e919fe1e335b8abcb3a28bfd4804a98d875a:
> 
>   wifi: mac80211: fix slab-out-of-bounds read in ieee80211_monitor_select_queue() (2026-09-28 11:11:19 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260929
> 
> for you to fetch changes up to d52302171b61dbba6c9c15e80e9a5f02f1e9f95c:
> 
>   wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume (2026-09-29 07:03:58 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v7.3-rc6
> 
> In ath11k, fix an IRQ imbalance during suspend/resume.
> 
> ----------------------------------------------------------------
> Baochen Qiang (1):
>       wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume
> 
>  drivers/net/wireless/ath/ath11k/core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Please drop this. As you pointed out this fixes a patch that is only in the
next tree and hence the fix must go through the next tree as well.

/jeff

