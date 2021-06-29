Return-Path: <SRS0=pU+T=LX=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DAFC11F67
	for <ath11k@archiver.kernel.org>; Tue, 29 Jun 2021 17:45:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB2861DA7
	for <ath11k@archiver.kernel.org>; Tue, 29 Jun 2021 17:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB2861DA7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UrG21I+IvtzhJiJpajqaVj7Ik77hWacVsmNkY01U8v8=; b=HAc+anrGGLUMDJ+VB/QW1yn9xc
	5zqQIkm+cpp/VvYWFPOL1/arbVXsUSTrcER8AwzzoTLq1EHE2vGnNdxkTtFlPSpZv0pLvFsmRPjGC
	IAmZVYtHFnvy18Qz+XwCW//0/XyRjO4hsyxVEjv+2qeQIcawRD7644MlAMdnfXQ88sziMMYqDtGuB
	+eOG3SDU34C5Cv0uw9XeJZTu7QA5bEPrXzjWF+MgZNdY60S4h+VjQ7byl+eVtTbs3mA2Pq2r+lsJD
	zDurYOYlGhscqS5IHoYxAP1TMPMOGxQtJhdjTArm5XoVIrzaZI6zFt3blVjUMYmv0j0Mhmgk6W3Dl
	iPcGvwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyHn9-00BlWp-V8; Tue, 29 Jun 2021 17:45:00 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyHn5-00BlW1-Op
 for ath11k@lists.infradead.org; Tue, 29 Jun 2021 17:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Subject:From:References:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wm96ttAfqELqdoCeZXAh41t/Wo5Pn1VIhdGSoa8LxTw=; b=k53iBDt+7zoyPjhPdqETsaZByg
 JOlxyBtElFQOOs9Lcx3y4EH7/i+6WcYxFrLd59hnFzwBm0P8DnGjlqntdTWKANXBFN0lA6/6Nm7zH
 HsPiqNFtlNnV5KosozksVvkq6EUkzNvb3/jjihuL55QdrrC3UrU4sHaofH+h0cuGbE7I=;
Received: from p54ae93f7.dip0.t-ipconnect.de ([84.174.147.247] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lyHn3-0000B5-QS; Tue, 29 Jun 2021 19:44:53 +0200
To: Johannes Berg <johannes@sipsolutions.net>,
 Maharaja Kennadyrajan <mkenna@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <1623164855-15910-1-git-send-email-mkenna@codeaurora.org>
 <1623164855-15910-2-git-send-email-mkenna@codeaurora.org>
 <f14e6e6b81978ace4580774981a7e032b4001182.camel@sipsolutions.net>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v4 1/3] nl80211: Add support for beacon tx mode
Message-ID: <0e3d0abd-a895-77d8-d3a6-ef6d2616b7db@nbd.name>
Date: Tue, 29 Jun 2021 19:44:53 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f14e6e6b81978ace4580774981a7e032b4001182.camel@sipsolutions.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_104456_012030_01E023D5 
X-CRM114-Status: GOOD (  11.00  )
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


On 2021-06-23 13:16, Johannes Berg wrote:
> First, I'd like to see some input from other vendors - is this useful?
> 
> I have no objections to it and it comes with an in-kernel driver, so I'm
> inclined to accept it, but maybe we should have other modes, etc.?
I haven't seen any config option like this outside of QCA stuff.
It seems to me that before getting merged, the documentation should at
least cover when and why the *user* would configure this implementation
detail, instead of having the driver/fw make a reasonable decision on
its own.

- Felix

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
