Return-Path: <SRS0=jWs5=NE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7A4C4338F
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 09:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7863360EB5
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 09:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7863360EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdsk6jwsB1zVnU2slJyrlEw8UQqmfCKF89kByj3IldQ=; b=GjzusodsJerAlWI864WxibXLSG
	VtLvU1hQfvBjQ8gIaSyXW2x1LpVUPVBcj7dr3OhIku84OqlLjOhsW89RSj+CQj+hNXxP9OGlQgKde
	iy8AD7srv0WaQT1lV/IQa1JC98cBRHJ7jj6P3Nf7DJCDv6PGcsCVfSNg0RPmC2DEMKVmbGkr94T6f
	1JsHSTMF0sUu8h5eS7k3ZS73UxyO28gBWJfV1cJREbuzXtFwPEdl1fNIB+02ksHbffp2x9fl4MVfv
	c0aOlBcdrdMrcSWpUWnlNWjPRXrYDazIcrLXP2awLk8FpBXqrfNsU8yrlldODCXDGhvw1neP76Rft
	Z/UNAWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mETJS-00CIeI-SM; Fri, 13 Aug 2021 09:17:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mETJK-00CIdr-JQ
 for ath11k@lists.infradead.org; Fri, 13 Aug 2021 09:17:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628846228; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fx6grdp4Bl6eyW5Q7Xj5xAn+VMkAsb769KNlsKMiU7o=;
 b=I8TDR8u3I+vAhaUL5M0dPmIPoHZxqv4J/Aw1IJOboIM1AZD9WTy8EFuHt4vtNJEdfziAMnO/
 P5DDnc+Jni3ZITYlrUTBtwQpBVI1ko1rc+mcTJtl4sOvtk+l3Yj5aZT8OOi+OkjqXXtVnt0V
 lmbv9R4L7Xw49iCJ7wjUnmf1108=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61163885b14e7e2ecbd07d66 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Aug 2021 09:16:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AD632C433D3; Fri, 13 Aug 2021 09:16:52 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D944AC433F1;
 Fri, 13 Aug 2021 09:16:51 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 13 Aug 2021 17:16:51 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <f61cdc7bae2dd2a645e164ca143b9db402472559.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
 <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
 <1273cc1a399a7457c3d908648a7651c8fe9b93f3.camel@sipsolutions.net>
 <a056e32d4911400fb0822bf02167e91c@codeaurora.org>
 <f61cdc7bae2dd2a645e164ca143b9db402472559.camel@sipsolutions.net>
Message-ID: <465b6b8535fc17ae51ee2f3116af87bb@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_021709_175977_F7632FB6 
X-CRM114-Status: GOOD (  37.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-08-13 16:53, Johannes Berg wrote:
> On Fri, 2021-08-13 at 16:47 +0800, Wen Gong wrote:
>> > > > > 2) Should we at least check it again from the protected beacon or such
>> > > > > after association, so we don't blindly trust the probe response or
>> > > > > beacon (received during scan, not validated) at least when BIGTK is in
>> > > > > use?
>> > > >
>> > > > May we add support for BIGTK in future with another patch?
>> > >
>> > > We already have BIGTK support in mac80211, so if we don't do that now
>> > > we're almost certainly not going to do it, so I'd really prefer if you
>> > > did it here, or if a separate patch still did it now.
>> >
>> > Actually, I should say though - the question was more whether we even
>> > need/want that, rather than whether we can do it later or not.
>> >
>> > If we should protect this data/information then IMHO we should do it
>> > now, but it's not clear to me that we should, given that we also don't
>> > have encrypted association response and we still take information from
>> > there too, etc.
>> >
>> > johannes
>> I prefer to add a new enum(not use BSS_CHANGED_TXPOWER),e.g,
>> BSS_CHANGED_PWR_ENV.
>> And add check in ieee80211_rx_mgmt_beacon() as well as
>> ieee80211_handle_pwr_constr(),
>> when the value of pwr_reduction or content of elems.tx_pwr_env 
>> changed,
>> save the pwr_reduction and elems.tx_pwr_env to ieee80211_bss_conf, and
>> notify lower
>> driver with BSS_CHANGED_PWR_ENV, then lower driver will do next 
>> action.
>> 
> I don't really have any objection to this, but OTOH it feels like
> drivers will probably not really listen to this if it can only happen
> due to BIGTK?
yes, it should have some flag/logic to check whether it is BIGTK.
If you know it, you can tell me. :)
> 
> And if we always defer this until the first beacon, that also feels
> wrong and bad?
It can not defer this untill the 1st beacon which pass BIGTK verify.
Lower driver need this info to set power before TX data include EAPOL.
> 
> I'm not sure what the right answer here is, TBH.
> 
> Maybe the right answer is to indeed ignore beacon protection for this,
> and do exactly what you did here, and say that the TX power envelope
> thing is just not meant to be protected, because the protection is 
> meant
> to protect the connection etc. and not the performance (and 
> regulatory?)
Yes, the lower driver also have the max power limit itself. If power 
calulated
from the fake beacon is bigger than the max power limit, then it will be
ignored.
> 
> Do we get this *only* in the beacon, or also in the association
> response? If it's also in the association response we could use the 
> data
> from *there*, and basically say that the association response might 
> need
> some protection (later) anyway?
> 
The Transmit Power Envelope is not existed in the assoc response, it is 
existed
in beacon. So it can not use assoc response.

beacon:
IEEE 802.11 wireless LAN
     Fixed parameters (12 bytes)
         Timestamp: 0x0000005070684036
         Beacon Interval: 0.102400 [Seconds]
         Capabilities Information: 0x0511
     Tagged parameters (264 bytes)
         Tag: SSID parameter set: Renhui-6G
         Tag: Supported Rates and BSS Membership Selectors 6.0(B), 9, 
12.0(B), 18, 24(B), 36, 48, 54, [Mbit/sec]
         Tag: Traffic Indication Map (TIM): DTIM 0 of
         Tag: Country Information: Country Code US, Environment Unknown 
(0x04)
         Tag: Power Constraint: 3
         Tag: TPC Report Transmit Power: 17, Link Margin: 0
         Tag: Extended Supported Rates and BSS Membership Selectors BSS 
requires support for direct hashing to elements in SAE, [Mbit/sec]
         Tag: RSN Information
         Tag: Extended Capabilities (11 octets)
         Tag: Transmit Power Envelope
         Tag: Transmit Power Envelope
         Ext Tag: Reserved (55)
         Ext Tag: HE Capabilities (IEEE Std 802.11ax/D2.0)
         Ext Tag: HE Operation (IEEE Std 802.11ax/D2.0)
         Ext Tag: Spatial Reuse Parameter Set
         Ext Tag: MU EDCA Parameter Set
         Ext Tag: 6GHz Band Capabilities

assoc response:
IEEE 802.11 wireless LAN
     Fixed parameters (6 bytes)
         Capabilities Information: 0x0511
         Status code: Successful (0x0000)
         ..00 0000 0001 0001 = Association ID: 0x0011
     Tagged parameters (169 bytes)
         Tag: Supported Rates and BSS Membership Selectors 6.0(B), 9, 
12.0(B), 18, 24(B), 36, 48, 54, [Mbit/sec]
         Tag: Extended Supported Rates and BSS Membership Selectors BSS 
requires support for direct hashing to elements in SAE, [Mbit/sec]
         Tag: Extended Capabilities (11 octets)
         Ext Tag: HE Capabilities (IEEE Std 802.11ax/D2.0)
         Ext Tag: HE Operation (IEEE Std 802.11ax/D2.0)
         Ext Tag: Spatial Reuse Parameter Set
         Ext Tag: MU EDCA Parameter Set
         Ext Tag: 6GHz Band Capabilities

> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
