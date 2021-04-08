Return-Path: <SRS0=LKqF=JF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CE8C433B4
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 09:39:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D0276113C
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 09:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D0276113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eFpY1IA/ZVn/g03HXGPbEsUtoR/F07jTS9g9nMfNTJY=; b=PDDd8scqGpiSjyvDuqp1WU0kN
	6CBZ3EtduE3AtUTB3mwYJDWMXbgy0ZncF+a/TUaYn8ojTlYOPz4TGshHmjaGbNsQO+1jxGBQ4wVBa
	exgDx34q9vFnREyQ+Ce6vGgpBiB0QbwLDz2bk8uo3GM488zrmZftuARq4PJZGYb2U+6ZLbFvJaqmy
	OkAYs8T7e2+T6AfivL762898pCG2UPU/1ByjoOJh0Uoh8Dy9KLNZuuTsl8nPYYZ/ZV+4TjUSnot+t
	YBLH0soNcUs47wgNFAMx4+h8e3q36SrJQD2KVx1QiHmLL+NzZkLyhqk9JslYitPZWuXyUYuklp8oQ
	t5BhXZ/RQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUR8S-007Wj8-GW; Thu, 08 Apr 2021 09:39:36 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUR8L-007Wf6-08
 for ath11k@lists.infradead.org; Thu, 08 Apr 2021 09:39:34 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1lUR8H-008wRl-Km; Thu, 08 Apr 2021 11:39:25 +0200
Message-ID: <246a7cca8e90c947e38caa9ddf1d028d9ae10bb7.camel@sipsolutions.net>
Subject: Re: [PATCHv2] mac80211: increment rx stats according to USES_RSS flag
From: Johannes Berg <johannes@sipsolutions.net>
To: Thiraviyam Mariyappan <tmariyap@codeaurora.org>, 
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 08 Apr 2021 11:39:24 +0200
In-Reply-To: <1613563010-1489-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20210217_125904_154301_738B3086)
References: <1613563010-1489-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20210217_125904_154301_738B3086)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_103929_202731_811A42BD 
X-CRM114-Status: UNSURE (   7.23  )
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

On Wed, 2021-02-17 at 17:26 +0530, Thiraviyam Mariyappan wrote:
> Currently, rx_stats were updated regardless of USES_RSS flag is
> enabled/disabled. So, updating the rx_stats from percpu pointers
> according to the USES_RSS flag.

I guess I'll fix it this time, but the commit log is still not saying
what it should.

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#commit_messages

Please, everyone @codeaurora, pay attention. I don't want to have this
discussion for every patch.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
