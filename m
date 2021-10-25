Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B50CC433F5
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 20:10:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 554A660C49
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 20:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 554A660C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bK2LL8BK3D+gkHu8RbUPABmsstLoNmJXXTs+6QYEwK8=; b=C+//VPuIjIRO2X
	SfGMx/+D/K8LkEViNQi9hADM3D5NZfVA+T/aMlz3OXaR8zgsXgwbrzEE6zFAzyOUG8v6YpetA515o
	o6DkrsXlgY7VGwYLoEeK+HaPCGP7JOvJlcZzTTfzQOys/xMO4DW+3ulGsTyifJ3ZuUFbub6NlGFKV
	kxPtl+rxnZTbhFYIwpFjDDuHAZ60kFGaqypS07qlr6yPgmdcj47f/od9nqcOHVIHHaaCNYwSrq2r0
	QLUru9JxBGZzsURZgo4Pt7Jre4AG07m6FR4yXkJyNDnAIhdQ3qfIqcfr6zPH/eTtG2ZDw4UOG/rlS
	E+HH5AqCX512gZa5HEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf6In-00HYjD-AC; Mon, 25 Oct 2021 20:10:37 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf6Il-00HYi7-0r
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 20:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=nkkwgBBru0cXAEZmmwkj0DeO6uvblFpcia5i86HDw0I=; 
 t=1635192634; x=1636402234; b=Vo5ypTjgbyGIJEnC79UxBcl0DckHjJphQ/ejn5Pm6sQcq1Q
 7T6dWadNRABL7vP2MdKcpbJvYFIqHvqGWqNMB95rmHui2VWTVPwy9xG+njHpxQ4kW83sgqTlK9Z8o
 oWu61hycfBO/G3JVSwIEXYrsYK1fxkn05JPfrEFnqj6rwvAMvOcAIuIsSbw/XHRiErxdTFHZGTDEd
 nfpYKGOQuK2NOInXVxpZQ0KzVcOyqhghfnUPaICW7DU8cCckkAjN8Q/au/1qqRhDOqY59ifht9342
 RocdmQ1bdQmFv//SZrA916n12rxy9PgPQADUPlFERnbMu7DaZdH6ocAn+CRyJK+w==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mf6Ij-006qTm-N3; Mon, 25 Oct 2021 22:10:33 +0200
Message-ID: <84fcbf3d0e53ba6e76a8396c7800acb72426053c.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/3] ath11k: Add ROC support for wide band scan
From: Johannes Berg <johannes@sipsolutions.net>
To: P Praneesh <ppranees@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sathishkumar Muruganandam
 <murugana@codeaurora.org>, Karthikeyan Kathirvel <kathirve@codeaurora.org>
Date: Mon, 25 Oct 2021 22:10:32 +0200
In-Reply-To: <1634906227-22028-4-git-send-email-ppranees@codeaurora.org>
References: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
 <1634906227-22028-4-git-send-email-ppranees@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_131035_095792_50FF6C9B 
X-CRM114-Status: UNSURE (   6.40  )
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

FWIW, not sure how this patch got mislabeled as 2/3 when it should be
3/3, but that caused patchwork to drop it. Might want to fix that when
you resend so that Kalle can actually see both.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
