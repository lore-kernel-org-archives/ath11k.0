Return-Path: <SRS0=0MIV=NB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD3DC4338F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 14:34:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7439D60E9B
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 14:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7439D60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Dpoz4phsNQge0/OJcBAkOsLg+8ygaVqUanqISzpW6cU=; b=BvY9P1sWdYtPZKTY9z9X22qDmP
	k0AL+JaA2q8bDL/XttjMxsYCEr4kcgCvjPWbHDtLdiZDoT3H3lpoX39nyzCrYmswNvAFAxEZh0tpI
	c81y0kZ4ThgxYp5tMJ1CYZsWt+G1sQ5t/nlYlrahGtiEl74MoU172SgkvqhSwTTu9kRM3xzIiyIVm
	rxfMilCPbDdbcXB8hnnbMLsQZGK+u8Rzg17nU+Zm9E9Nun24Fd4Bto7b7df3EgGZjggcojPmO/jQq
	Trq8EegXzX/oCMG/NMW6o++4rg8nH5flMltaqOYsUhIjzqP1C2hLebnf3D3bBfVK1ji7nUGgzSt56
	cndYTVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDSpG-004E1j-Ni; Tue, 10 Aug 2021 14:33:54 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDSpA-004Dz3-1i
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 14:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pq8olG0UKW6uZw5KvpM2GjfJamYM6oRBk+UVQL254Dg=; b=JRumlcIKMOZtZcGFcdr9iq3Aon
 HzC6s1hUJUBr8ZdxTBKYKnwJkIR1ikFna/hQ8MJ3XS4Nx1dBEc7DLfLOoNK1mGeNE6DPkX8vsw6mN
 l9w5cHvEqGQSnFT2OQfyfZJp+NiWyw2j4Syto10+vJKFIfVXDVV2bKKoFH4Jofot4d8s=;
Received: from p4ff13206.dip0.t-ipconnect.de ([79.241.50.6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mDSp4-0003HS-4s; Tue, 10 Aug 2021 16:33:42 +0200
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
 <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
 <7eaa665c-7f9b-268c-5297-4d3851e10e43@nbd.name>
 <f96e91618142c34172d12954f2f08ce9@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <92b48724-277c-fc48-a922-6b1d49cd6a71@nbd.name>
Date: Tue, 10 Aug 2021 16:33:41 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f96e91618142c34172d12954f2f08ce9@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_073348_764187_CD6F3C39 
X-CRM114-Status: GOOD (  12.28  )
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

On 2021-08-10 14:02, Maharaja Kennadyrajan wrote:
> On 2021-08-10 15:44, Felix Fietkau wrote:
>> On 2021-08-10 10:56, Maharaja Kennadyrajan wrote:
>>> User can configure the below beacon tx mode
>>> 1. Staggered mode and 2. Burst mode while bring-up the AP
>>> or MESH.
>>> 
>>> Beacons can be sent out in burst(continuously in a single shot
>>> one after another) or staggered (equally spread out over beacon
>>> interval) mode.
>>> 
>>> Set the beacon_tx_mode as 1 for Staggered mode and 2 for
>>> burst mode.
>> What's the advantage of one over the other? When and why would the user
>> choose a different mode other than the default?
>> 
> [Maha]: In the multi-vap scenario and default or staggered mode,
> tx failure of the packets will happen if the packets duration
> is greater than the beacon interval between the two vaps.
> In case of burst mode it works, where during retry it transmits
> the packet.
It still seems to me like something that the driver should detect and
handle internally without user configuration, based on number of VAPs
and maybe multicast/beacon rate (since the packet duration issue will be
worse with CCK rates).

- Felix

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
