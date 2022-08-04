Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0876CC19F2B
	for <ath11k@archiver.kernel.org>; Thu,  4 Aug 2022 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0JkMLOAAx6W1NUpDY/KOfNf0/S8ToT3PI/ewaGUhJk8=; b=Djk
	+hernXjV9CprB+APsK3aQbZHHMjRwWob93GDfpvaJ8Kpr9fUt0ude/tJVEODZH0+d4Pzfqywa5xu+
	HtDDE8vsDYniLTck1TbiB+Mco9iFSAWsTagLRWfUTtRv80I4Pcec1GgUvPbxjb2vsdjzCtJytztOe
	ov2ZtWuQcYOuJxZ35cLLUREwXNuOgn6OzXRiLmnSM5jPLUQM54PVljqXN78Qd46cc5BV+Aq/bOj98
	Gw2ndxaAst161eghsSvQ8Ul1ZTP0JcLGURsW5roTqsrF5tkLNwICOJE321yP0bNLLZUAdbnSVvHYm
	80Fvs+mGF1nOMsQsKdZBzKItTW6NQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJZBy-005dna-St; Thu, 04 Aug 2022 11:39:06 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJZBw-005dmA-5h
	for ath11k@lists.infradead.org; Thu, 04 Aug 2022 11:39:05 +0000
Received: by mail-lf1-x136.google.com with SMTP id e15so20369660lfs.0
        for <ath11k@lists.infradead.org>; Thu, 04 Aug 2022 04:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ccxtechnologies.com; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=sP21HecxWrjmg0aPCv1GeRqGO1NM1pgMtwGSNeyazq4=;
        b=VIgjn6gbeSUJzUemP1iCBmo/CpBFbkOKHqKOiHDbHURnOVz0VAcFMLeX45qX5QFVIG
         9ZsdTVym/52HkryIRwGmobnVCvEaHEw40Y0pPvuVAMn1gMnTCLf/xgM0VLtAwiyIqttv
         t0jqas1BNttRiR93qJ2ao4lO9GtZSsi3/mXjfNYVXZYBtv3Mu7kUH5dz7oPJ1SwhPE6u
         PXnDOQBm4Ur08mvdGhkpDSHeIp2m5Pe8uAi07bYy00zAeP+zuf1Ma86p5y2rlA7V3wUz
         YlieFdZrh9LWd8URmUja1rjZh5x4fYQIlkHYOJ4FCUMcbQmNdjnUpBNm/PWUR0FiOLOy
         fN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=sP21HecxWrjmg0aPCv1GeRqGO1NM1pgMtwGSNeyazq4=;
        b=iJxD88WLvlOgd6LI0sAZZEBxwwLovjyZ6xv7+aRDkIBrnz2y8JbQ1mxWK52b6OHWrb
         /tYoFk3ZNWNwHGsEcNTTNOfTsn3wG5DPs4B5hQshrBUIc9CW/e0bmxFyFbBoWi8La0dJ
         uTE3PWqV+licHOS/kbrYPN/d9DQu2HoPpCA9icUZwhctFyG2GRiacKYTyERF3bbtNJEJ
         pB8QekWmjuK8zNchE7nXskhcLoP6TXJ2Q7WrO87KducdHRpMvANMTi1FSkWdD2YGHNkK
         A3fH6+mbMPg6uZj3jKHXgz7ZWN/nNdKU2/larpmqMzsLEULBmcqjROEKSeJw+pNPlVGX
         4K8g==
X-Gm-Message-State: ACgBeo0VD2b0bbIKV4APqiaia/TwemJGrR0vrStrBdKO0JUn/LnaMS3G
	UrUW4T5Yy78f5kqzgOfGMqjeU7ZKXZvRMAgeWVwJkkQXP6CWNQ==
X-Google-Smtp-Source: AA6agR42jdXa6HZZPKMpwqC7sDzzzaSw5USfZMIBBKWgs8CGiqnc8lvMcIfB26PFDEELWWjVsDgr2pfM7QpDHJ8l7lo=
X-Received: by 2002:a05:6512:c0f:b0:48a:fef0:c8fe with SMTP id
 z15-20020a0565120c0f00b0048afef0c8femr529963lfu.283.1659613141445; Thu, 04
 Aug 2022 04:39:01 -0700 (PDT)
MIME-Version: 1.0
From: Charles Eidsness <charles@ccxtechnologies.com>
Date: Thu, 4 Aug 2022 07:38:50 -0400
Message-ID: <CAAV4SYbZ2Uqp3pwsLPY8Ge6JA99sfoGXP9eBw8pbYj7RR2uLQg@mail.gmail.com>
Subject: qmi support for multiple socs
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_043904_226148_59504FD7 
X-CRM114-Status: UNSURE (   6.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello,

I would like to get two QCN9074 based cards running on the same system
but am getting these errors with the latest available drivers:

[    9.317198] ath11k_pci 0001:01:00.0: host capability request failed: 1 90
[    9.324007] ath11k_pci 0001:01:00.0: failed to send qmi host cap: -22

I think this is a known issue and someone is working on it:
https://lists.infradead.org/pipermail/ath11k/2022-April/003017.html

Is this something that I could help with?

Thanks!
Charles

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
