Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D42FC6FA69
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=izK40dATHMMM5vlQKxj5rjrZvvMZZPO4ut+o101bzeo=; b=WjYYXkasvLfYne
	GLj3g2pOXf+pm0/ZC7ICzjhobWPe7j2arB29EHhy8ptWYHPUNoySX9/4FfH3KrZCeakWmGzYZ3hq7
	BzxcFBMFfWh7kZm6ntyp8lMn7935vZznt9hphSJZ6DqaZwSBRm8fen2DdcZfVrKt6lnEKJOdiME2e
	rcq46JauRSI5cDWGB9tmocGYHH4qMvq0+IhdvMxHM3hPbBoaFDxwWRe8tDfjUshlwyXR+AVnLkTFO
	OEWIoEJfmisYUGM8uYSpEqyspmylh1MTumVVuo0v2PtaoCUgAwFn26/yNb+yvLtnVZ7B9u3lWbGyL
	+LZTVNjEWwkNeDvzoOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiOc-00C1UF-Hf; Mon, 29 Aug 2022 17:17:58 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiOZ-00C1Tm-Nl
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 17:17:57 +0000
Received: by mail-pj1-x102c.google.com with SMTP id z3-20020a17090abd8300b001fd803e34f1so6740943pjr.1
        for <ath11k@lists.infradead.org>; Mon, 29 Aug 2022 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=DiLkstIXq8DyIP6HhX1ZozUynqNQLPq1NrMHtVydxyg=;
        b=sC56IWQLVlsWEUPul4XTzt/jL8m1Vk4YULWUWfEVQpukkn0iNmdxc1H8cHUPIXFQ15
         xZJ/o/dczSW9Y697dJaBY9QatMQ0OyKHp+fCk05EFx8EkRUHhRioUI0GsE48B7Fsa8YM
         8bpm9Xi0Se6yZLtmPo4GV3AOq12lm4RoT+/ss+vx5Q9W4WW3bHOX+rsMDOAXuQ8nwJnE
         pBMJLufVlrRhvjcKCDK+a/qzTyzeHnZTZ8TiW9PDY8oObI+66S+ZrV/IJeUQOPr8Nk1D
         +HWjiWaD+8el+5C2aIH9Wr1Ag60dok8NcKfiaK6k2Atkdou1bXQAMflCivtdh0lc7m4K
         H5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=DiLkstIXq8DyIP6HhX1ZozUynqNQLPq1NrMHtVydxyg=;
        b=eAMVUetV4Mk7iOzj/ekug9ro6vtyw5ANCMZM/iw0YVzkmE5wG2UjEgVmBUpIPe9I4V
         lt2LNdquCtJKfgyL4Sr4XzT8IqVe15K6klHDCB4+dSXIAUCU5NVr0dx9SIWDLv1tSDqK
         OGjD4oMjwy/J5CCmgpLjYPCxrZTvleWu2TVTcS7Bzf/PHNF0AbX0L8cHlLQ8lFSSiRlJ
         KU1tB9NlUIa1eHcUg1RNVK1cOU8q+K3a9WKHXTQDXlLp4G4C3O1YZJWTs9pw2WEZp900
         Ep4JpufVM+Cg5xZUR74iPwY/PH/9khFfJ23db4rTJtr6apJ4zMgBAN+w1bQ2aqbpCoTI
         PbsA==
X-Gm-Message-State: ACgBeo3IGFj8SAdoafe+4VtppTeM8vdw0Uu/QJZtAeGJhLDoSuwuCi8Z
	HFesvBiyBYFzspp4a+1qTF6L
X-Google-Smtp-Source: AA6agR6e2gsuqcTsolq5lN8sraWrqgRFrwqvWA6hF4HTqekOI7HE3UmO4u2KScEcjsOVnHww0rzR6A==
X-Received: by 2002:a17:902:8ecc:b0:174:3c10:542b with SMTP id x12-20020a1709028ecc00b001743c10542bmr16455090plo.91.1661793473685;
        Mon, 29 Aug 2022 10:17:53 -0700 (PDT)
Received: from thinkpad ([117.193.209.245])
        by smtp.gmail.com with ESMTPSA id p63-20020a625b42000000b0052dcbd87ae8sm7554014pfb.25.2022.08.29.10.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:17:53 -0700 (PDT)
Date: Mon, 29 Aug 2022 22:47:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: quic_hemantk@quicinc.com, mhi@lists.linux.dev,
	ath11k@lists.infradead.org, kvalo@kernel.org
Subject: [GIT PULL] MHI fixes for v6.0
Message-ID: <20220829171746.GA84334@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_101755_866910_C69129E2 
X-CRM114-Status: UNSURE (   7.61  )
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NjgwMzViMDFjZmIxMDdhZjhkMmU0
YmQyZmI5YWVhMjJjZjViODY4OgoKICBMaW51eCA2LjAtcmMxICgyMDIyLTA4LTE0IDE1OjUwOjE4
IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tYW5pL21oaS5naXQgdGFn
cy9taGktZml4ZXMtZm9yLXY2LjAKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhY2M1
NDk1YmY3NjRlN2U0NDExOTNmOTcyZDk2YzVkMjg4N2Y2YjhiOgoKICBidXM6IG1oaTogaG9zdDog
Rml4IHVwIG51bGwgcG9pbnRlciBhY2Nlc3MgaW4gbWhpX2lycV9oYW5kbGVyICgyMDIyLTA4LTI5
IDIyOjMzOjQ2ICswNTMwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBIHNpbmdsZSBmaXggdGFyZ2V0aW5nIHRoZSBNSEkg
aG9zdCBzdGFjazoKCiAtIFNpbmNlIHRoZSBjb21taXQgMTIyN2QyYTIwY2Q3ICgiYnVzOiBtaGk6
IGhvc3Q6IE1vdmUgSVJRIGFsbG9jYXRpb24gdG8KICAgY29udHJvbGxlciByZWdpc3RyYXRpb24g
cGhhc2UiKSwgdGhlIE1ISSBjb250ZXh0IGdldHMgZnJlZWQgZHVyaW5nCiAgIG1oaV91bnJlZ2lz
dGVyX2NvbnRyb2xsZXIoKS4gQnV0IHdoZW4gdGhlIE1ISSBJUlFzIGFyZSBzaGFyZWQsIHRoZSBJ
UlEKICAgaGFuZGxlciBtYXkgZ2V0IGludm9rZWQgZHVyaW5nIF9fZnJlZV9pcnEoKSBpZiBDT05G
SUdfREVCVUdfU0hJUlEgaXMgc2V0LgogICBJbiB0aGF0IGNhc2UsIHRoZXJlIHdpbGwgYmUgYSBu
dWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UgYmVjYXVzZSBvZiB0cnlpbmcgdG8KICAgdXNlIHRoZSBm
cmVlZCBjb250ZXh0IHN0cnVjdC4KCiAgIFNvIGZvciBmaXhpbmcgdGhlIGlzc3VlLCBsZXQncyBj
aGVjayBmb3IgdGhlIGV4aXN0ZW5jZSBvZiB0aGUgY29udGV4dCBzdHJ1Y3QKICAgYXQgdGhlIHN0
YXJ0IG9mIHRoZSBoYW5kbGVyIGJlZm9yZSBoYW5kbGluZyB0aGUgSVJRLgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpRaWFu
ZyBZdSAoMSk6CiAgICAgIGJ1czogbWhpOiBob3N0OiBGaXggdXAgbnVsbCBwb2ludGVyIGFjY2Vz
cyBpbiBtaGlfaXJxX2hhbmRsZXIKCiBkcml2ZXJzL2J1cy9taGkvaG9zdC9tYWluLmMgfCAxOSAr
KysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a
4K6/4K614K6u4K+NCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEx
awo=
