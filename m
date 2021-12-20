Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C31CC433EF
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 20:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2A4C8k1QwmsJyh59B6tQItz5a9AF9axjhZ4Lt2E4iLc=; b=uvxIRD2l2iDz8w
	8AeiQ2qofynYe8ORmwP3MStIFz0DUr3XFDwg2g/0qjGQJqXbEmHfqQPKseYdN2rcypRamJkyoUPVa
	VvpeGr/aLGHeUF/VUryXR0YzbdL0w86JM9IwcE1tZfkhkMf4vfq4kU7nmZHDgZRWp1LWdulPZSykD
	sLpZmq+qpGHVNWH9DM6X2FXmCRxION9hd/RhuUR5sMz4/YWg83sWlZtJcJJG9sNYjcEEEjoodanc3
	AaH3Zzn0qOAFDcJGNkUMR9hwvm/pMtcjZLb5XWAvxf/kmo/ZTJuF+Ni+Fb9Eaot+FYVjjY1LACaEN
	cgFotPt+3F21PgmzTYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzOqc-004Cmz-Pf; Mon, 20 Dec 2021 20:01:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzOoW-004BOt-E7
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 19:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=XhRlgf2a5CbbiRyXO8oZczbzc5/ynnvuggu4+2QxDG4=; 
 t=1640030355; x=1641239955; b=sL2fYaLCTWpZTrkLDBbFmHmS4DO5jYjO0EhDstd8DxqPJS/
 iTrGFYPXQU28e0e1EoWtMQd3PUZF/y+c2Ynffq1hLWfTWIj07voQs/JMzcCz6C86b3NqS94Ni4MsX
 Co/gyQVAQOY3fqJgFTSJtFHKJl3OyCbB8zkU+wYUWK+jYiZmbyjja5P6wSa9ak7RoUimHVm30++lj
 5VSriGdwzbtYkPwa+6zhIBpU1zMF49WDx7y2nrBzYx2OvUwbpcfbtTpIDOAJuEhxyHGK3q0DjTWZy
 StESTe+1pYAZEcGV6Tt5F24nPTP0dh6F3jmIZ15rYV51HCIDvmX3n0V/3HSpWSiA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mzOoQ-00EFC2-B4; Mon, 20 Dec 2021 20:59:10 +0100
Message-ID: <534d1f71596289581e9229c3087e2ac2f7528ebe.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] ath11k: add LDPC FEC type in 802.11 radiotap header
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Mon, 20 Dec 2021 20:59:09 +0100
In-Reply-To: <164002780766.16553.11348226804666046524.kvalo@kernel.org>
References: <1638294648-844-3-git-send-email-quic_ppranees@quicinc.com>
 <164002780766.16553.11348226804666046524.kvalo@kernel.org>
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_115916_550635_6649E7A2 
X-CRM114-Status: UNSURE (   8.86  )
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

On Mon, 2021-12-20 at 19:16 +0000, Kalle Valo wrote:
> P Praneesh <quic_ppranees@quicinc.com> wrote:
> 
> > LDPC is one the FEC type advertised in msdu_start info2 for HT packet
> > type. Hence, add hardware specific callback for fetching LDPC
> > support from msdu start and enable RX_ENC_FLAG_LDPC flag while passing
> > rx status to mac80211.
> > 
> > Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
> > 
> > Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> 
> Depends on:
> 
> 57553c3a6cfe ("mac80211: fix FEC flag in radio tap header")
> 

Technically, you could apply it, it just won't be very useful until you
have both together.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
