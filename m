Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECB6C433EF
	for <ath11k@archiver.kernel.org>; Tue,  8 Mar 2022 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1c46NVNIXm6ku13IfsSx5irB7407iHo/yzWkAVmh6VI=; b=0NI/tXPXvQqJa6
	LsxLhrlx/rTqMlIiCActlJ5f98RZmYDE+vFUg7kY0QhbLWOTBAmx2KlvCIoHCHfsf1xzfMVoiQ7Fd
	MkFSdSafO2TNKNSFyKX8bjZfQvq9A60uz8UQjz8dic/0ptDH0Cplzjq5gD6ZKWVGFmVnbPJB3mUSY
	PGmPS/rS0G3o+CUAPjmbs5DsuuIZJIOvVTFpMyU0oFhGKLuSH+IFSALStepEhItFdxYE1/kBq68eP
	c2xurZ18wMzx8f3KqQjyH/OW0EfXua3Qj/kXKILxdLDKZ1kws6Myyhzv1QRfUtr1/4OfbLDl71vgf
	rqqZrAzyX9NOYwD20lVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVct-003Nfj-E6; Tue, 08 Mar 2022 08:55:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVco-003Nce-NO
 for ath11k@lists.infradead.org; Tue, 08 Mar 2022 08:55:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so946046wmj.2
 for <ath11k@lists.infradead.org>; Tue, 08 Mar 2022 00:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TIGGAdxcAJktyvvLN7ctm6KsCvgqfCMtQ7c4CCL5b9c=;
 b=PxD5TRqKcZ1b3ymH5+Oa12FXgi/OSAiKAiKh74vrtv6udbgxWfDklShr8z6zcP7Vix
 eGFExX1IuXeXIl2Em4otYNMv7g6YeNZl90T+AnYfZMUty+KuSPxIGUCRrP1GZW+Fbu4K
 ePKuDmXz7Oa6OM7CNA+La6vhFEjwiuA5Dr7gDg2FwiiV+LxMOnGZhg0cNEbwKpnDjQns
 MJlEzYuQiLjqaNP+GogpIXOvSmPvg4OaDRKG+PmUgNEiUlZH1aKaYmGhnOqwZrzkNxr9
 Yv9z4iqp5i5av3zDuap6eNcq+AaHRO7y8p3C92PIHPXjAJ22/Q4p0ypOFs9RAmrT5pTG
 /uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TIGGAdxcAJktyvvLN7ctm6KsCvgqfCMtQ7c4CCL5b9c=;
 b=OPLJWxZwTKz7FUcQq0rv6vICxpNy8c2Xfe1N/4reAA+GWR9XfAdFtINj4LA4PqaAtB
 eyD8JYUPuyo0g99j12UAM+0hMdUz5CUvsIwqavRBcFDf8VM/2sxWZhSfW82wHCTDtwyD
 8cSV0dJFyb66jNuKUUCIh7Um0VhkPHx5AT/rILXcbKXhZBoC+lsR4vqPL/V8kPshs2FT
 8QWkq1ZEMEyw4XheMmytkEvnsFijp0sJ1+z6bHmPnGX7CkHTOUkYDZdFs8k3ekUs7Fwe
 KSRq+F/CM7Hhi/i6YChBqvunPKiW9d9uRcd4zhxNI3qf8bGnRHwVzBT6oAPsRNlpSCQm
 SaHg==
X-Gm-Message-State: AOAM532LwNTghlXMKw7NxNctT9+QTd+cFcF4zCv2dYvgePq9FNsb6ccQ
 4ZR+EEhZfYlhN7hixo+sL0A=
X-Google-Smtp-Source: ABdhPJyL/5OQs6l/obkYBGgeF0liuRveJql9sGbkP8ZS8KK+vx90gFAxqH3v48tm8CGKlHLABm2wKw==
X-Received: by 2002:a1c:3b55:0:b0:389:89bc:4207 with SMTP id
 i82-20020a1c3b55000000b0038989bc4207mr2578544wma.132.1646729720711; 
 Tue, 08 Mar 2022 00:55:20 -0800 (PST)
Received: from felia.fritz.box
 (200116b82626c9000cc91df728b27ead.dip.versatel-1u1.de.
 [2001:16b8:2626:c900:cc9:1df7:28b2:7ead])
 by smtp.gmail.com with ESMTPSA id
 e4-20020adffc44000000b001f1dba38a65sm8147557wrs.105.2022.03.08.00.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:55:20 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] MAINTAINERS: rectify entry for QUALCOMM ATHEROS ATH11K
 WIRELESS DRIVER
Date: Tue,  8 Mar 2022 09:55:03 +0100
Message-Id: <20220308085503.537-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_005522_810407_6AF2B026 
X-CRM114-Status: GOOD (  11.37  )
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

Q29tbWl0IGRhZTA5NzhkNDE3NCAoImR0OiBiaW5kaW5nczogbmV0OiBhZGQgcWNvbSxhdGgxMWsu
eWFtbCIpIG9idmlvdXNseQphZGRzIHFjb20sYXRoMTFrLnlhbWwsIGJ1dCB0aGUgZmlsZSBlbnRy
eSBpbiBNQUlOVEFJTkVSUywgYWRkZWQgd2l0aApjb21taXQgZmNkYTFjYjgxNjYzICgiTUFJTlRB
SU5FUlM6IGFkZCBEVCBiaW5kaW5ncyBmaWxlcyBmb3IgYXRoMTBrIGFuZAphdGgxMWsiKSB0aGVu
IHJlZmVycyB0byBxY29tLGF0aDExay50eHQuCgpIZW5jZSwgLi9zY3JpcHRzL2dldF9tYWludGFp
bmVyLnBsIC0tc2VsZi10ZXN0PXBhdHRlcm5zIGNvbXBsYWlucyBhYm91dCBhCmJyb2tlbiByZWZl
cmVuY2UuCgpSZXBhaXIgdGhpcyBmaWxlIHJlZmVyZW5jZSBpbiBRVUFMQ09NTSBBVEhFUk9TIEFU
SDExSyBXSVJFTEVTUyBEUklWRVIsIGFuZApwdXQgaXQgaW4gYWxwaGFiZXRpYyBvcmRlciB3aGls
ZSBhdCBpdC4KCkZpeGVzOiBmY2RhMWNiODE2NjMgKCJNQUlOVEFJTkVSUzogYWRkIERUIGJpbmRp
bmdzIGZpbGVzIGZvciBhdGgxMGsgYW5kIGF0aDExayIpClNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1
bHdhaG4gPGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPgotLS0KS2FsbGUsIHBsZWFzZSBwaWNrIHRo
aXMgbWlub3Igbm9uLXVyZ2VudCBjbGVhbi11cCBwYXRjaC4KCnYxIC0+IHYyOiBubyBjaGFuZ2Ug
aW4gcGF0Y2gsIG9ubHkgYWRkZWQgbGludXgtd2lyZWxlc3MgYXMgcmVjaXBpZW50CgogTUFJTlRB
SU5FUlMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDJiOTZhMjJj
ZjVlYS4uMWU1NjcyMzYxNDZmIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJ
TkVSUwpAQCAtMTU5MjMsOCArMTU5MjMsOCBAQCBNOglLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwu
b3JnPgogTDoJYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKIFM6CVN1cHBvcnRlZAogVDoJZ2l0
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rdmFsby9hdGgu
Z2l0CitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3Fj
b20sYXRoMTFrLnlhbWwKIEY6CWRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvCi1GOglE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3Fjb20sYXRoMTFr
LnR4dAogCiBRVUFMQ09NTSBBVEhFUk9TIEFUSDlLIFdJUkVMRVNTIERSSVZFUgogTToJVG9rZSBI
w7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+Ci0tIAoyLjE3LjEKCgotLSAKYXRoMTFr
IG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
