Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4490C5B572
	for <ath11k@archiver.kernel.org>; Thu, 13 Aug 2026 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9XLCxOIm85fIIs/oaVmZtJIQ13dsGAPw34yNA1NUWg=; b=LSsFEo1H/E/ifdJDQYmyt5oz7A
	XHyyo1DWjwDB3yMMkDANvq7MDCR4PcG/qf5OKgf++Cz5YCPrDwcx8YktR9YwT6uhjdD8C2U3eT35Z
	uAE+MOg/QbaV2pauiCLS6KPkC4IzNDNb3ctChtP/jvLGcRMVtOz067UalUHyCY6/SAzAwC1nS0Ury
	1BIiPMA+x/ly7Eu7W2iN2YmaocWhH02IZucXhFE3V8bIiMUb+aFtHOEXx58xCbImDMdsjBKlf57qm
	hJcmD1X3FVDAhqScm6HqLN0otgB3YLg5wE0sbejHln9z0A5jY07c49bPqnvft8SORNmiGar/qY+dE
	8ShLDzTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZB8-00000001Hbm-44l9;
	Thu, 13 Aug 2026 17:25:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZB5-00000001Ham-47PG
	for ath11k@lists.infradead.org;
	Thu, 13 Aug 2026 17:25:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DGV4BW2076960
	for <ath11k@lists.infradead.org>; Thu, 13 Aug 2026 17:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9XLCxOIm85fIIs/oaVmZtJIQ13dsGAPw34yNA1NUWg=; b=KFaag13nIa7JeA7Q
	2OOAsYwqqjYVQbFfYZ2VLTY86mEC/7ZkogH1w3geoqOBrPYmXccQONSrOZfOF7mE
	fouvpSakud2YuQH1tfhtatd648ECL0sNtWNoc/cfc7GgBwKBr77gLXkdBevKy4Jt
	vt/O1uYAm0aJppWiIZtkb3b2PA7aOKJWZ7KRm7bfFRW0nlTJDdPj9LjeitB4lE3M
	PTtykIoSZ1jy+i6JraDzTsfwXz6Q7mnlcNYh8XWlRFJo6cTSDKNcg9gZoX0GprJV
	zpBenw2rsKMy8ooEFqTyk4+jBoxxKClGFTJd99BhIhFp1UWZ66Gk/zRcIhzBUkEy
	v+myhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy0835-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 13 Aug 2026 17:25:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso70301a91.2
        for <ath11k@lists.infradead.org>; Thu, 13 Aug 2026 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786641914; x=1787246714; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9XLCxOIm85fIIs/oaVmZtJIQ13dsGAPw34yNA1NUWg=;
        b=AWRbCL22WMmICmQacp9GTLH/eSBWvWEivXWaR9ZLg162NzKoL5w4g7GkDACAtoIHjS
         xmQQsD8BWxH8sdXJr4fq4Bg93M0RN/dL7h9c8j+mRC8713JeQpZo0G9p2lKKtxkFjc6M
         Wna/WcuzmrmoLfQNqgqLICSnfJ6ci2IFUOv+GO+1uPFoCe6uzQPuTGT/Ly72A8CxTCO7
         U5UoL+dlN4rS2g8ELSYWrwUiiSAooie+bm/YQUl3zZOSai/Yzd1fafYBS9gkKtGheVyY
         PnH593oH61G5wTzgxRwQZTqpi/fd2gX+3ahwvRtO3soSVUiep4ozRqFvQRT6j3mzhtOt
         Fpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786641914; x=1787246714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9XLCxOIm85fIIs/oaVmZtJIQ13dsGAPw34yNA1NUWg=;
        b=VRZppXI9RvpOY/CPqtFUshXWrFLCIK6BkRUUHfy34m5FlgyUL1iOmRQegbl1ASDEcU
         9EXmu6WLaSBK1rtEpYAj6589xH7MW33Nb7KkzJxbdkbHU/qfg8parXtSJj0CutiQ0RmT
         XA4z3XJGYnRFLGEQM8yDyj/sclmS/rquJIkSqe8bxO0Jn/ZdSi7s01YzNvFIQh64jib1
         c9fQyrluJsqj/z8/UUYuLvWL9C+ZUshcAQfXxG5QLDVA5FjMzlVrVR+oAThaN4qruvoh
         gLJC5k5okiIFg+fSr0rSWrOw3qCrz/ZrTEGNlepf1gcyNwO1HehJ/9eJFOm7Z5ijn4BC
         ZztA==
X-Gm-Message-State: AOJu0YyY5sw05oOU/+10QNUX/tT+l+Eh2W9pSy/xmYpR/mTBPwPlGEzP
	rzD9hxBh4AQh1Nst5Dyw20eDNVjZpouHQc4jjrp21kpCsQpkNKAZDRgRn+LVpyowfmP+4LhZsHo
	PUSXhBeDfrAG2ywapwBCy977ACUu53oRvT+GgyqAthlF1alwdDcoLkJ3f2xOt2N8f
X-Gm-Gg: AR+sD13Dln4JIRSUDrI2D6o2UN3QFpPa+eNDKgjmBJMozdGBWyPUxBmQ3pnqO31aUCi
	o5YH6kc9cekg6ecJU+XdS7DfAnAiNfBrgfa4g18wPgePRYV/Q9FS8N8YD6B3RrrYFRd85TZxPV5
	bJJdWlzwADGl4tu2Qm6Y17W5ZQ+vIK0MKpBHhiscCzpk8GMQs3QWUXvXJyLQZh6LItdLg2VVu4t
	rHuBZfLl/hPvnDxSBLtdlLEzfRI4SD/X3k4KcaoY5tIePcgWM/5otzqqhtR1RIM5CYdRkWho0mb
	n/sSSF6HwtSDoLycFdiH0m6n548q43sj22Wq2xBe+omTPQ8J0E27cOxyMw5QJUW1Fb5IRL5/FMZ
	29KRPMW1ea2PgVPXO3eeR+Bca7UagVZpwVy6HpS6xNknqd+kh6kxm9Fep+WSk
X-Received: by 2002:a17:90b:580e:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3931e2537dbmr9784673a91.16.1786641913639;
        Thu, 13 Aug 2026 10:25:13 -0700 (PDT)
X-Received: by 2002:a17:90b:580e:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3931e2537dbmr9784609a91.16.1786641913128;
        Thu, 13 Aug 2026 10:25:13 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d8d6sm10610340eec.4.2026.08.13.10.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 10:25:12 -0700 (PDT)
Message-ID: <0bac4c07-6c78-478c-b3ec-1d897cdd8acf@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 10:25:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, pengdonglin <dolinux.peng@gmail.com>,
        =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
References: <0b72231d-59f8-49bf-82a0-76d2c7862729@oss.qualcomm.com>
 <20260811111405.397112-1-jtornosm@redhat.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260811111405.397112-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNSBTYWx0ZWRfXxSW3MHp+DYtv
 EZeUYFdxnWDi15f/ZAc4Dh32jeCkUSd/YwpU6+bL29z/qVdIJitl7awJc+WPN3+m9j/SPK+QelR
 44RqB6TpJdm9JBhcLNYZkc7QIItunosk9ncYvN23tfoMQ6Pa4z9yRH6Y4ZuQL6WISZdZ9DY0dJj
 9HanOUPOMjgW2pWjRAUYmf7pePtpEEZHAjFCXJyx7Om4M0U7V62uMrsH07+RsZ3b1cbn8nFEpk0
 C/zqqD+qEYH/KL9yI6Fd9vvdLf4dmwanE1+v2/JChmgRmeyCOi8Y2oYp37qvB3lLkT9pOOu5OxR
 bUOEcpZmG2jDhVl3QI9fAUqHEx7uOua5Vosf58hixzqrW3IaLBgernXSw7iNYIsaez2fo/LcnKr
 x3YwwzBvKPdQdpSywD/HB+oIXuzkZYI8iCP5YbAVUxm53tIpxHOAigXWLB282BivzBtjLiiMZhm
 KEPCDcK0JrGf8Rhp58w==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7dfdfa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=aIEVAj3FgTlWRZ7fGdMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: B8pnAk7KtL4A-vHO4t16djj_5AQWyfma
X-Proofpoint-GUID: B8pnAk7KtL4A-vHO4t16djj_5AQWyfma
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNSBTYWx0ZWRfX2ad18EA6F3iN
 E/NZTDgnEGgzSW8KqaZ+73UgP76ExTcuqXrP2TM55tyUj/gHcT3jD9/QQma/slNuwjnEjRNEpqK
 O9w9Wa5SBe3vUiV5nT+bKFGyGfyYTPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_102516_131850_7CD66C10 
X-CRM114-Status: GOOD (  10.13  )
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

On 8/11/2026 4:14 AM, Jose Ignacio Tornos Martinez wrote:
> Keeping rcu_read_lock() for the entire function is intentional. 
> ath12k_wifi7_mac_op_tx() calls rcu_dereference() internally (on ahvif->link[]
> and ahsta->link[]), and with CONFIG_DEBUG_LOCK_ALLOC, rcu_dereference() checks
> lock_is_held(&rcu_lock_map) via rcu_read_lock_held(). 
> Only an explicit rcu_read_lock() sets rcu_lock_map and spin_lock_bh() does not,
> so releasing early would trigger lockdep warnings.

hmm, so some of the following commits are broken?
https://lore.kernel.org/all/20250916044735.2316171-1-dolinux.peng@gmail.com/

In particular the one that I merged into ath9k:
https://lore.kernel.org/all/20250916044735.2316171-15-dolinux.peng@gmail.com/

diff --git a/drivers/net/wireless/ath/ath9k/xmit.c
b/drivers/net/wireless/ath/ath9k/xmit.c
index 0ac9212e42f7..4a0f465aa2fe 100644
--- a/drivers/net/wireless/ath/ath9k/xmit.c
+++ b/drivers/net/wireless/ath/ath9k/xmit.c
@@ -1993,7 +1993,6 @@ void ath_txq_schedule(struct ath_softc *sc, struct
ath_txq *txq)

 	ieee80211_txq_schedule_start(hw, txq->mac80211_qnum);
 	spin_lock_bh(&sc->chan_lock);
-	rcu_read_lock();

 	if (sc->cur_chan->stopped)
 		goto out;
@@ -2011,7 +2010,6 @@ void ath_txq_schedule(struct ath_softc *sc, struct
ath_txq *txq)
 	}

 out:
-	rcu_read_unlock();
 	spin_unlock_bh(&sc->chan_lock);
 	ieee80211_txq_schedule_end(hw, txq->mac80211_qnum);
 }

I fed that into my review agent and it confirms your observation:
  The change works correctly on production kernels without
  CONFIG_DEBUG_LOCK_ALLOC. It will produce a false lockdep splat on debug
  kernels with CONFIG_PROVE_RCU because rcu_dereference() checks
  rcu_read_lock_held() which requires an explicit rcu_read_lock(), not just a
  spinlock.

I have a fixup for ath9k which does:
      171 -  ratetbl = rcu_dereference(sta->rates);
      171 +  ratetbl = rcu_dereference_bh(sta->rates);

Should ath12k also use rcu_dereference_bh()?

/jeff


