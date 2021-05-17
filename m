Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C12AC43460
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A34661352
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A34661352
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sCUNEAo9kbNhKNBaP7zr3HObsut2ePPRUlyPQ3hEsj8=; b=RacaUo12WG1SN4sAV2zmPKg2t
	kJLIw99fzYPn4ETZEAUix2gFGgFuwOymk2vOPS9v8It1Rx2qCGuV9ylBeXi0EYJ7fkxEZGuPFzs7Z
	Yk4Wl5yslg18yAYanAlXiY2Be7niT5ok/oxBgTZ9SUGQ6E4mBSfR+voUMpnAincb5JZOnPPrB5z8H
	sBqee0LKbEb8Fu5ReK7uyD+i+8kpmQ4MDV0lBSTrzKmeqQfBs2XuIG7SeVDiUTt1gDDpHLjR3DhA9
	Z2mfTrwOuUr4p2J0Mp3lPxveCm1QAKYij4GWoQ3R1ph7W51T0Oxhy3ctRW9qi242MniAD4hHYXoG8
	dTLQWXvjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijjA-00G2nr-En; Mon, 17 May 2021 20:20:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijj3-00G2mR-Q6
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=n+zVQOhh2k/MElkBkxeXhh/b1v9515nxkUatCtVPed8=; b=YcISGRosxtHpPkc8D5BvO6Oe32
 y7zI/H1PmElT0s0FxOQuI1bWNhCpqQx4dfO4PYXzm9/U90o/oWCxck3rzNKdmImI/M/BoGlA2qrhv
 fq3opc7oQvuU0GuGOW9c24V6Dkvyhe3DpHiDdZ6DlwuGX1+YgWtbHXCD8ihJX7bf+Y6m8M8OWCb90
 KJv1mt+ZZlpqb8yLwSxHeT0GBaKQqrNvddcZU4exbk4WfHmWuH95IYjKYb5FUyrPX8PIJ+HV33Jnf
 AZWjzMFz7V9BIJokZEFVw5dW2cPHdm1yJ9bG/YGnTdN8eWR6br3NzIoargXENtQH5rhkUgK7xPX4W
 DiO/Cmwg==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijix-00E7mP-PR
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282827; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=n+zVQOhh2k/MElkBkxeXhh/b1v9515nxkUatCtVPed8=;
 b=MafEN4lKZSuOxOL8BmqfdbBCMqMVpD1U5Pp/iR8lWQGL8UOOLd0qt5gcsepg8h914ZzVwIQR
 BjooZKshzXPlk/vdD4NkI7nhKlJ7nuaBYqbD7OCX87/4l8hKPdwLOvCrePVmqisyiBT8CMxU
 zdLyVxH+mawUJfnt2yDNjXDFRTI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60a2cffd67d156359aff4b3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 30737C4323A; Mon, 17 May 2021 20:20:13 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FF19C43217;
 Mon, 17 May 2021 20:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FF19C43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 6/9] mac80211: add definition for transmit power envelope
 element
Date: Mon, 17 May 2021 16:19:29 -0400
Message-Id: <20210517201932.8860-7-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132027_380058_4E3015A8 
X-CRM114-Status: GOOD (  12.81  )
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

SUVFRSBQODAyLjExYXjihKIvRDguMCBoYXZlIHNvbWUgY2hhbmdlIGZvciAgdHJhbnNtaXQgcG93
ZXIgZW52ZWxvcGUKZWxlbWVudC4gVGhpcyBwYXRjaCB0byBhZGQgdGhlIGRlZmluaXRpb24gb2Yg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+Ci0tLQog
aW5jbHVkZS9saW51eC9pZWVlODAyMTEuaCB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pZWVlODAyMTEuaCBiL2luY2x1ZGUvbGludXgvaWVl
ZTgwMjExLmgKaW5kZXggODk0YTJjNGQ3Y2I3Li5hMzliNWZjMWRmZmMgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgvaWVlZTgwMjExLmgKKysrIGIvaW5jbHVkZS9saW51eC9pZWVlODAyMTEuaApA
QCAtMjI5Miw2ICsyMjkyLDM1IEBAIHN0cnVjdCBpZWVlODAyMTFfaGVfNmdoel9vcGVyIHsKIAl1
OCBtaW5yYXRlOwogfSBfX3BhY2tlZDsKIAorI2RlZmluZSBJRUVFODAyMTFfVFBFX01BWF9JRV9D
T1VOVAk4CisjZGVmaW5lIElFRUU4MDIxMV9UUEVfTUFYX1BPV0VSX0NPVU5UCTgKKworLyogdHJh
bnNtaXQgcG93ZXIgaW50ZXJwcmV0YXRpb24gdHlwZSBvZiB0cmFuc21pdCBwb3dlciBlbnZlbG9w
ZSBlbGVtZW50Ki8KK2VudW0gaWVlZTgwMjExX3R4X3Bvd2VyX2ludHJwdF90eXBlIHsKKwlJRUVF
ODAyMTFfVFBFX0xPQ0FMX0VJUlAsCisJSUVFRTgwMjExX1RQRV9MT0NBTF9FSVJQX1BTRCwKKwlJ
RUVFODAyMTFfVFBFX1JFR19DTElFTlRfRUlSUCwKKwlJRUVFODAyMTFfVFBFX1JFR19DTElFTlRf
RUlSUF9QU0QsCit9OworCisvKioKKyAqIHN0cnVjdCBpZWVlODAyMTFfdHhfcHdyX2VudgorICoK
KyAqIFRoaXMgc3RydWN0dXJlIHJlcHJlc2VudHMgdGhlICJUcmFuc21pdCBQb3dlciBFbnZlbG9w
ZSBlbGVtZW50IgorICovCitzdHJ1Y3QgaWVlZTgwMjExX3R4X3B3cl9lbnYgeworCXU4IHR4X3Bv
d2VyX2luZm87CisJczggdHhfcG93ZXJbSUVFRTgwMjExX1RQRV9NQVhfUE9XRVJfQ09VTlRdOwor
fSBfX3BhY2tlZDsKKworI2RlZmluZSBUWF9QV1JfRU5WX0lORk9fQ09VTlQJR0VOTUFTSygyLCAw
KQorI2RlZmluZSBUWF9QV1JfRU5WX0lORk9fSU5URVJQUkVUCUdFTk1BU0soNSwgMykKKyNkZWZp
bmUgVFhfUFdSX0VOVl9JTkZPX0NBVEVHT1JZCUdFTk1BU0soNywgNikKKworI2RlZmluZSBHRVRf
VFhfUFdSX0VOVl9DT1VOVChmdikgRklFTERfR0VUKFRYX1BXUl9FTlZfSU5GT19DT1VOVCwgZnYp
CisjZGVmaW5lIEdFVF9UWF9QV1JfRU5WX0lOVEVSUFJFVChmdikgRklFTERfR0VUKFRYX1BXUl9F
TlZfSU5GT19JTlRFUlBSRVQsIGZ2KQorI2RlZmluZSBHRVRfVFhfUFdSX0VOVl9DQVRFR09SWShm
dikgRklFTERfR0VUKFRYX1BXUl9FTlZfSU5GT19DQVRFR09SWSwgZnYpCisKIC8qCiAgKiBpZWVl
ODAyMTFfaGVfb3Blcl9zaXplIC0gY2FsY3VsYXRlIDgwMi4xMWF4IEhFIE9wZXJhdGlvbnMgSUUg
c2l6ZQogICogQGhlX29wZXJfaWU6IGJ5dGUgZGF0YSBvZiB0aGUgSGUgT3BlcmF0aW9ucyBJRSwg
c3RhdGluZyBmcm9tIHRoZSBieXRlCkBAIC0yODczLDcgKzI5MDIsNyBAQCBlbnVtIGllZWU4MDIx
MV9laWQgewogCVdMQU5fRUlEX1ZIVF9PUEVSQVRJT04gPSAxOTIsCiAJV0xBTl9FSURfRVhURU5E
RURfQlNTX0xPQUQgPSAxOTMsCiAJV0xBTl9FSURfV0lERV9CV19DSEFOTkVMX1NXSVRDSCA9IDE5
NCwKLQlXTEFOX0VJRF9WSFRfVFhfUE9XRVJfRU5WRUxPUEUgPSAxOTUsCisJV0xBTl9FSURfVFhf
UE9XRVJfRU5WRUxPUEUgPSAxOTUsCiAJV0xBTl9FSURfQ0hBTk5FTF9TV0lUQ0hfV1JBUFBFUiA9
IDE5NiwKIAlXTEFOX0VJRF9BSUQgPSAxOTcsCiAJV0xBTl9FSURfUVVJRVRfQ0hBTk5FTCA9IDE5
OCwKLS0gCjIuMzEuMQoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
