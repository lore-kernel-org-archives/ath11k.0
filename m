Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A68C433EF
	for <ath11k@archiver.kernel.org>; Fri, 11 Mar 2022 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cN/sr16+DNQn6qSMrsKHR5000///OnThOdZ3tQaSbq8=; b=ZlOnwXDE4hREJ7
	lPAUEV9S0GZsNoGekYCPr+Hv0hM61rRTI6J+ngvGICbs2gNlCOyrl3rV4PZpkz7hk7WLyuTpjqW8m
	1fFo4URTmx5vlhjmClRVohmC7jlyyAwDyzUYEfIImUENp9ryHQmNZrtnSRz5Oeyq5ZO6mltp8GaKn
	3uW1WbQsaWzZeMF4TbVtiW4UEnG+Rnrf5f5DejBy8YhGKU7VzzcTB4CJuctHnidfmbqBaKONJxcCY
	spu7uRQChyT6jlOvDzz3W7fImo/6lQZ5Qn0tr0wbpdw7Z2biT6Oc3X1xpJ2gnszsEp6Y87Z53y+Y8
	Dj359zhGLhePX1Zir5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSd4U-00G9fn-5r; Fri, 11 Mar 2022 11:04:34 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSd4R-00G9fG-7V
 for ath11k@lists.infradead.org; Fri, 11 Mar 2022 11:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=tT3PmHXOIm03ht15TW/b67NPUC59dtYRiHXV8ks50d8=; 
 t=1646996671; x=1648206271; b=mb/uK1V5AEXbXijDQ1lR8nS4v411Rx83Kk/+MHWDmrakT20
 JEwazl48e6CXnbQ8vbw5Ts20yX5vIuh493AcyOavk2/kF6zuZVT9UW5vyLoUqKUSev7GSjUyskc4/
 HOP3dMiuWHDhBPz+fDWCOL2uX5Q5u0gb6LGxXERA8IGlIso9lYiAbW++tbZvS1ShPGlyV7z7TzZe9
 GD7R4HCoGKM2WD4ooM8VYZsokVYzcXdC3SERQiCu98YhFMS4vxx8DGa40ryGgEZTxXVZhoL/BEMce
 knCHTtGCGzpZtt77s6Y+5Si1dY5lX6Qe6LQstUBrZrT+dG/sVLqCOj4IDkSh7ESQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nSd4P-00BsdQ-Qo; Fri, 11 Mar 2022 12:04:29 +0100
Message-ID: <623add710d06dfd90291cb788756d37046ea2c74.camel@sipsolutions.net>
Subject: Re: [PATCHv2 1/6] nl80211: vendor-cmd: qca: add command for CFR
 configuration
From: Johannes Berg <johannes@sipsolutions.net>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 11 Mar 2022 12:04:28 +0100
In-Reply-To: <1645005922-7252-2-git-send-email-quic_vnaralas@quicinc.com>
References: <1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com>
 <1645005922-7252-2-git-send-email-quic_vnaralas@quicinc.com>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_030431_308539_C4B1942E 
X-CRM114-Status: GOOD (  14.64  )
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

On Wed, 2022-02-16 at 15:35 +0530, Venkateswara Naralasetty wrote:
> Channel Frequency Response feature is to get the channel state
> information from the hardware based on the user configurations
> and send the CSI data to user space.
> 
> CSI data is further processed in user space which can be used to
> identify the motion of the objects.
> 
> Add vendor command support to configure per peer CFR parameters.
> 
> An example of usage:
> iw dev wlanx vendor send 0x1374 0xad cfr-en <val> bw <bw> method <method>
> periodicity <period> addr <mac_addr>
> 
> 0x1374: vendor id
> 0xad: : vendor subcmd id
> val: 0 to disable CFR capture
>      1 to enable CFR capture
> 
> bw: CFR capture bandwidth(use the values in enum nl80211_chan_width)
> 	1 - 20MHZ
> 	2 - 40MHZ
> 	3 - 80MHZ
> 
> method: Method used by hardware to collect the CFR dump
> 	0 - from the ACKs of QOS NULL packets
> 	1 - from the ACKs of QOS NULL packets with phase
> 	2 - from the ACK of probe response packet
> 
> periodicity: Periodicity in ms at which CFR dump need to be collect
> 	0 - single shot capture
> 	non zero - for Periodic captures
> 
> mac_addr: mac address of the peer for which CFR capture is requested.
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> ---
> v2:
>  * Updated the commit log.
> 

That's a bit better, thanks.

However, it still doesn't address the question of why it needs to be
vendor specific API.

Is this something fundamentally tied to the hardware? Fundamentally
vendor specific? I'm not sure I see why it would be?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
