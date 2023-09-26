Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E1E7D24B
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 07:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NZOhyDGnxWwkYutadcXwssp8EzryEAIopsvCGDcuqBk=; b=k0A7ddqsC9UDot
	zofqsCNwD35AwjGeltuE2Q0hu5JuQG/rGkn0CoL3OYKdzBtPN47zKKutleqEmQlqAJTMPN/zWShNX
	WyiNXNTiKujR0rF4ZPVDa9DOJwf7BRYdlDqVeewxeG5OfkdVFZmpFBD2gdW3OnjdWeN6TgoMqQPT6
	92Fk0XuqxdxjH32xVVY4HoFV1J7hyPUQVSMwf5wzZPvhDtRcDwhkz3e0TUEU5/gGvMxe95PfrHs2k
	nbThsH7RD5gPfs3PGRuQowSkPc0sijlmkIx5vf727aTlh7azY+dCTtZDk9Kr2e1F0thrDHRnTydqy
	77u0kTsicHebXmTSrY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql2si-00FpEG-1b;
	Tue, 26 Sep 2023 07:53:20 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql2se-00FpDh-1d
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 07:53:18 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 887A724027; Tue, 26 Sep 2023 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1695714720;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=gnVlPayPKGpzFlQtVdAvubb9NP4kdey5r4Kdgmdpu+RVxZHhskRAfEsH0TWD5utp8
	 w6wehrwmHMtDN2oF36xfpbCVHjAMTJNqNrN9j6ObX/oOB22Y5rpeSAx6S5bBaBZ8mV
	 CVvmpyut6xsIUYDo35gVlE4iXGRG4S0qARkPEnV2m/sl8p7APcEkMBXjKUTo5CrajY
	 LgWpgphLyZlFJmDdnSgPOKTaOyU0j7STomAnSoI3qAtC/6nsv4ca3teS6AhXOUMIXC
	 /2L+QEm9gGeuQyW9hFJr5IVBy0hRDD9+ugIhyP5DLVchs/sIfCUv3PSWsryaXEQ1zF
	 znYIcgZrz6ziw==
Received: by mail.synergyflux.pl for <ath11k@lists.infradead.org>; Tue, 26 Sep 2023 07:50:48 GMT
Message-ID: <20230926064500-0.1.75.x9gw.0.xhltkq7wk2@synergyflux.pl>
Date: Tue, 26 Sep 2023 07:50:48 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <ath11k@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_005317_304741_B4A042F2 
X-CRM114-Status: UNSURE (   0.97  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KCgpQb3pkcmF3aWFtCktvbnJh
ZCBaaWVsacWEc2tpIAoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MWsK
