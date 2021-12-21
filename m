Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D70DC433F5
	for <ath11k@archiver.kernel.org>; Tue, 21 Dec 2021 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZn93JqpF4SQ0AfLupD/fbSRR6C3JtOPZB36JbBj56w=; b=43iX0fij55tHyO
	jateqF1PO8hRT7ErsWdiHDis0DPghCR5BbUanQ9eRy3vCQqSIVnkszE/FiYyq1pKQTp30W7hSd3RD
	rKeCGXJu4twYC9M3pgVbR68i+lqL4T3qcey6I3QTHMVA88BAGmj8zw/lz1wwLzw0NZ8BwUhVbFqMi
	z0ZnVeouF1U2hwknr2xbD9IqK2wV6Cj4iFqf8k8OgWB4v307Agf4PyobFlVdeWLfWn5QVrBxuTsXj
	23jGJwoL/WVRj5OrNyapBhP1lssTM5oQU9rFLX87QMBCtkpOP2qL6Z7B/75nvsO4CKNOiGI8LVP/1
	PHqAgob0IpXwq2Fx1TeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzbuG-006IZJ-Vw; Tue, 21 Dec 2021 09:58:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzbuE-006IYJ-CK
 for ath11k@lists.infradead.org; Tue, 21 Dec 2021 09:58:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5941B8106E;
 Tue, 21 Dec 2021 09:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A519FC36AE2;
 Tue, 21 Dec 2021 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640080679;
 bh=3B3BEE++w2lQuM6+elGAcYKeVc5hHSDFiICQ+o8ABmE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=b880flp0fmDACiSsvBcTAFvRZh0K+PGUueG0Kfb+v85b0cGTOsDuG4CXUDR62R9EF
 kVeubXHZrvKqbg5CQHi9swcGpzElGBSIKrGl7NtPWpHC+llR6p5gmugLQfhavDlhbd
 Q4Yv9Lr6ed22vRQMdeHLmWAnqljOXM39+Ur+MUqWQrGC9h0CcVq9UVvNXRVS8IqTeP
 HMwazhZiynynA9q9gbg7FQZHLfdnupZzFUmD40j4jw0ArQ+yQj+dvwSa0E2zysONcd
 0oX2H43hxJN+61ZHmOCKDNN1FE31iGp4jF4vwxsVggkcx0Hbladbd4pfq66inM7BeK
 YCkQ0NMmaF11A==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: P Praneesh <quic_ppranees@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/2] ath11k: add LDPC FEC type in 802.11 radiotap header
References: <1638294648-844-3-git-send-email-quic_ppranees@quicinc.com>
 <164002780766.16553.11348226804666046524.kvalo@kernel.org>
 <534d1f71596289581e9229c3087e2ac2f7528ebe.camel@sipsolutions.net>
Date: Tue, 21 Dec 2021 11:57:54 +0200
In-Reply-To: <534d1f71596289581e9229c3087e2ac2f7528ebe.camel@sipsolutions.net>
 (Johannes Berg's message of "Mon, 20 Dec 2021 20:59:09 +0100")
Message-ID: <87ee669t5p.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_015802_592214_218E7443 
X-CRM114-Status: GOOD (  12.75  )
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

Johannes Berg <johannes@sipsolutions.net> writes:

> On Mon, 2021-12-20 at 19:16 +0000, Kalle Valo wrote:
>> P Praneesh <quic_ppranees@quicinc.com> wrote:
>> 
>> > LDPC is one the FEC type advertised in msdu_start info2 for HT packet
>> > type. Hence, add hardware specific callback for fetching LDPC
>> > support from msdu start and enable RX_ENC_FLAG_LDPC flag while passing
>> > rx status to mac80211.
>> > 
>> > Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
>> > 
>> > Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> 
>> Depends on:
>> 
>> 57553c3a6cfe ("mac80211: fix FEC flag in radio tap header")
>
> Technically, you could apply it, it just won't be very useful until you
> have both together.

Ok, thanks. But to keep things simple I'll still wait for the mac80211
patch to land ath-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
