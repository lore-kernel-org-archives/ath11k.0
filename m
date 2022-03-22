Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19D9C433F5
	for <ath11k@archiver.kernel.org>; Tue, 22 Mar 2022 15:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bl8Bp37Mdh1Xa1j/QqWLbmE+FTQHxw6WY4R3sdBitg=; b=LAbcmL98ljApyF
	oacytU9TBo0RM+0So0YHYS2N8fcuErtBxExuBmokFclKyLXBI5ufH/sIVIhZar5QfDDqQoJnBslCN
	jQj91qlv2vBLFFhPUOPdVqykM27poSX2mjGrrzorr73EqEK6FXH/58/fLSFSXGh8CEBxRiT8fJK+d
	qKtnjzGpc0kADltRYxPg3KQZeD1BqAcciqvNjKjjKi0j6y5cbHplwtslnays5gIZSxK6iKOpfRUWd
	+jZLJDiOW1EfGl3UiXm5y4ZVL1XdE8J+w92rWhkj8GdjjW2jysqLMt4ZVDfs3DqDt8kcREmuHrq5t
	KyLJu3xclXKQlJaVcQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWg3q-00BT20-An; Tue, 22 Mar 2022 15:04:38 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWg3m-00BSyk-HL
 for ath11k@lists.infradead.org; Tue, 22 Mar 2022 15:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=HzJWqJffoHTfJ5iJdRWHRzvNFUKMdQZHExGFGT/Q/l4=; 
 t=1647961471; x=1649171071; b=jl0RDJNMXPXBz0Ht0VNpU6IxosRFVTd5HBo9YeyWBTzxaLi
 EGLP0rCUv6ynEsL1vRw5si8tkX0hne6nXgXTwIdezUVNhG0Q26UoD1qjoSqYQve30hqHxSC1Ad+8o
 fpD8+XSL2e8qzxWpCzDLRlkbNEdERgc4VGbT30SBZuTasuwTRdml7m1Ihg4UvAPW+ENzZ7FfFmgbD
 MQb/FIvy4NXs7NuihYGFXpyMqSy0sMbRD3uPaWIM43s4JhYIfim84NO6ADOB+/MfKNlkVsUuZedoi
 qAfqqnzTGhg8zelvSZlKMtkjsB/liQRCk9+4mDr5LuxA4/69iPrLd/97JO27oe0g==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nWg3a-00GfVI-C1; Tue, 22 Mar 2022 16:04:22 +0100
Message-ID: <babc75d310031f9f92736d5da65679ca50542849.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
From: Johannes Berg <johannes@sipsolutions.net>
To: "Rameshkumar Sundaram (QUIC)" <quic_ramess@quicinc.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Date: Tue, 22 Mar 2022 16:04:21 +0100
In-Reply-To: <DM6PR02MB493734ADBBC6C996845B9EF3E9179@DM6PR02MB4937.namprd02.prod.outlook.com>
References: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
 <1644914581-21682-2-git-send-email-quic_ramess@quicinc.com>
 <a517835c51a5eaf00e87fdaaef47546f70ff0d42.camel@sipsolutions.net>
 <DM6PR02MB4937C53041172E9A52846A0BE9169@DM6PR02MB4937.namprd02.prod.outlook.com>
 <a537c6e02afbfa26eec2a54dbd8bc649f77ae3a3.camel@sipsolutions.net>
 <DM6PR02MB493734ADBBC6C996845B9EF3E9179@DM6PR02MB4937.namprd02.prod.outlook.com>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_080434_633363_72E726B3 
X-CRM114-Status: UNSURE (   8.22  )
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

On Tue, 2022-03-22 at 13:50 +0000, Rameshkumar Sundaram (QUIC) wrote:
> > 
> So, Suggestion here is to add a new NL attribute to carry the
> information from user space for
> START_AP and SET_BEACON NL commands and use it here, is that
> understanding correct ?
> 

Well, I was thinking it would reasonably come with the beacon rate, i.e.
as a new attribute like NL80211_TXRATE_DUP?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
