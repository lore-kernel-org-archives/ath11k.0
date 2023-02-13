Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53833C636D4
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYpPZ/ORzUWkmak4x0BmaQ3iR4+c3Zj2e1004S6ohJA=; b=jdyMpSDBnmDoHd
	VXHxLqOp0XiWx/kKnrDvK9EzdHZEmKXJNlkr74Sd+icuCMEU4agGceQOXnqWSnT/rKwxrKqEHdVHk
	66ZEwJOd8ZtBlGXsB9vczH2FDzRzpbfVSbnQTz86ag6SaloaLb7As9NQxEC4e78kNz0qth8zTMKTS
	NxlAW06syZuRXHLyRVToBrpBdS/kX0STkbMoQ2fA4LpeH6ukLxrXM8AwvDYu03eh7IPKHGSHN6qLg
	Q7q4g9HFeEA5IYdOkDUVbRbcFIr4yjy5Tg9xbO+oZtkiCMX4vbbeyC5B/O0YSTZb1Yq3hh1k5Ydc4
	AkVew0KiV+hYTVjpQ7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRY20-00EePS-Oe; Mon, 13 Feb 2023 12:34:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRY1v-00EeNh-0P
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 12:34:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BF0B61018;
	Mon, 13 Feb 2023 12:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F91BC433EF;
	Mon, 13 Feb 2023 12:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676291638;
	bh=y/2PNTTp0WU9n9seyOU2p79291AiqS6hxjKqz3xJri0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WJsutstLNBHViXtEQPLfRSNt4X6IHBFsC3tkljZ3h4mF2KFUHl8FWKtpqTx1/sGJo
	 ZRzcZWJyhnerjfh+IrMKbbK3DQ6LjnFYkZZ0y7uKtyIxSDBAiHfQMtEiavkKt1l/8s
	 oy52PhUkjybS4Fh4rBg5dTOdLo7XdmiJGQsRWZBPDX2zbY81nKAK4m/XI2TVt9PbCx
	 tBeIiSvYu53dIPVZT6+heiFVn/r8d37HDzqWmcZzts8UzqqOsHNW6e2JE13caXYeyp
	 /TduOWf8nAxv/5ZMRnz5MNsJ7W1GroD4mOGbEklY1zye6JUv1DcS+Uci2DmEdUGORm
	 d7DXolpz3dZ4Q==
From: Kalle Valo <kvalo@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,  ath11k <ath11k@lists.infradead.org>
Subject: Re: Resume from hibernation fails due to ath11k_pci
References: <1263051271.53086.1674425560245.JavaMail.zimbra@nod.at>
	<873579wze8.fsf@kernel.org>
	<370539199.123516.1676291073661.JavaMail.zimbra@nod.at>
Date: Mon, 13 Feb 2023 14:33:53 +0200
In-Reply-To: <370539199.123516.1676291073661.JavaMail.zimbra@nod.at> (Richard
	Weinberger's message of "Mon, 13 Feb 2023 13:24:33 +0100 (CET)")
Message-ID: <87pmadvj66.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_043359_122240_F4D7295C 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

UmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JpdGVzOgoKPiAtLS0tLSBVcnNw
csO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImt2YWxvIiA8a3ZhbG9Aa2VybmVsLm9yZz4K
Pj4gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JpdGVzOgo+PiAKPj4+IE9u
IG15IHNoaW55IG5ldyBMZW5vdm8gVDE0cyByZXN1bWUgZnJvbSBoaWJlcm5hdGlvbiBhbHdheXMg
ZmFpbHMsIGFuZCBjcmFzaGVzCj4+PiB0aGUga2VybmVsLgo+Pj4gTG9va3MgbGlrZSBhdGgxMWtf
cGNpIGlzIHVuYWJsZSB0byByZXN1bWUgdGhlIGRldmljZS4KPj4+IFRoaXMgaGFwcGVucyBhbHNv
IHdpdGggTGludXMnIHRyZWUgYXMgb2YgdG9kYXkuCj4+IAo+PiBVbmZvcnR1bmF0ZWx5IGEga25v
d24gaXNzdWUgaW4gYXRoMTFrIGJ1dCBubyBmaXggYXZhaWxhYmxlOgo+PiAKPj4gaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTQ2NDkKPgo+IFNvIHRoZSBkZXZp
Y2UgaXMgdW5hYmxlIHRvIG9wZXJhdGUgYWZ0ZXIgZW50ZXJpbmcgQUNQSSBTNC4KPgo+IElzIHRo
aXMgYSBidWcgaW4gdGhlIExpbnV4IGF0aDExayBkcml2ZXIgaXRzZWxmIG9yIG1vcmUgbGlrZWx5
IGEKPiBmaXJtd2FyZSBjaGlwIGlzc3VlPyBJIGRpZG4ndCB2ZXJpZnkgd2hldGhlciByZXN1bWUg
d29ya3Mgb24gV2luZG93cwo+IHRob3VnaC4KCklJUkMgdGhlIGlzc3VlIGlzIHRoYXQgYXRoMTFr
IGV4cGVjdHMgdGhlIGZpcm13YXJlIHRvIGJlIHJ1bm5pbmcgZHVyaW5nCnN1c3BlbmQuIEFuZCB0
aGlzIHdhcyBiZWNhdXNlIHNodXR0aW5nIGRvd24gdGhlIGZpcm13YXJlIGZvciBzdXNwZW5kCmNh
dXNlZCBwcm9ibGVtcyBpbiB0aGUgTUhJIHN1YnN5c3RlbSBkdXJpbmcgcmVzdW1lLiBUbyBmaXgg
dGhpcyBJCnN1c3BlY3Qgd2UgbmVlZCBjaGFuZ2VzIGJvdGggaW4gYXRoMTFrIGFuZCBpbiB0aGUg
TUhJIHN1YnN5c3RlbSwgc28gbm90CmVhc3kuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2ku
a2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMK
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
