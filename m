Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFA8CD3440
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dnZTLfPBq3s3Da2DqBjriorpRBU/d6uIDxI87h8TXI=; b=o9dEH4WmqJ95YxVcTsv+AXPamy
	c9DMIrmTWVdu7o2+JoLQUBHvoi0qx3s85rdtavwQb+XSbmyIDzaIxmcmrh0sM1zcjP+2oHfxdJzqe
	ou00qoNs+NURZdBcsBczftK0wU5UX+C8G19PLRhgj4hoIYLRj0jxPAe1ZTcuO7vrGDrLBR5If+Uz4
	7Hg0cTRrZKxQB40kj9Q1r9AZnK+IHcaZmQDagf4VAHF5opCp99nGImZ2HfmzCkmquQvYR4UCqswAb
	70j4vVMecJS7//wQ803XVYblKn3dfUAwEcHhnaMXYXIaHa0wqbPHw4RZA+rwiQIu3KR0qL874neRu
	X1NP389A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcWX-00000000vvU-1Uhg;
	Wed, 06 May 2026 13:42:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcWS-00000000vrX-3Avb
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 13:42:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so3270538f8f.1
        for <ath11k@lists.infradead.org>; Wed, 06 May 2026 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778074963; x=1778679763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dnZTLfPBq3s3Da2DqBjriorpRBU/d6uIDxI87h8TXI=;
        b=q2Ix8QoDeUGt5byBb4RanxYz1A9Epc/Yvu4NSyCJGCwmkb1JbCg7u42+shouR+Dlf7
         fQXADOggRyaD0E8BupuC1akbYSoVYimb0fhH6j+hVnxW6p0xN3kGdlskcjA+dEIPXM/D
         lcn+EXu6zBvWrJVh/tzFDWkBN9ZQXQIaYG47aJE3cQrbGUdqTxFwnzoKVwS4dysPHfQ3
         ZDNIl6GvqqnY+I0MVPyI0OnMUxQDwdw6OIkNPItxkrCLFu2ExusCGZ7jRl/OSmAy/pm1
         Tc15T02I9j6/qqStdk2IMNU3L5PI30P+f+XRloAfxSFZmVBWJwmC3Mnxyd9LP5SErXAf
         5s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778074963; x=1778679763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8dnZTLfPBq3s3Da2DqBjriorpRBU/d6uIDxI87h8TXI=;
        b=gGXMl975Tp6GcEFC0VC8rpbcWo+z5W1sEJnOE/WTuj0LyJ869Pnjkr8z1E8QJ03P+N
         /V+Ot9klWG+yRfDyfdt//h6v1WXWg3mnffwO+T1bneEvwOVP7NlT/bjzlZF+0SOJ89Qv
         E/lnTr42rhbkRU47gaAl3RjdJbg/LiK2T0fOicaPHHdZh526IUK6GhhXd4IcNjGG72oN
         lTqoy080m33kHtuFEG8FebT+86rzhKfm5XFeMZztwo+QH5ONXkcXh5uK6twI10NRp6+c
         JCGD7hulfOm2K3b5L7JbX6pIn3V5sgppikwRcea9UGF5YgX5Y3djwPTRO6pOevWgQtn2
         +N9w==
X-Gm-Message-State: AOJu0YzMqAtkbjQVQxSip3sC3Q8IfOIN8lJD2SKJEBi8jyhL3eKMVowN
	dz9iWXJb9hXji7xfxebpTXJSu6usn3HNGeWkOlMpQiENL1kqubiMtDmJT0KPLg==
X-Gm-Gg: AeBDiesrM87WkXzEpG4nEd6DB5bYfGdZXJjkWpQEFSb/Poleo8AEUG1j+oY/UgH+pH4
	7ko0NcQOy9iwQiK15tWzlf3uN2lxN1GE2WJf4y57m+Ei1qMebe/eDG1Kh8dvcX4kYfjoK5uH5m1
	1zY2OiPzXosJvzX55L/olRkmDlA2vC4ka+1dWBPoTi+GUAFuHieBIHY86w2MPL+GDVdD+Q0sume
	3fzYxSi8bZkc37INdE4JvbY82qOdLa3//z7THly8t3XFJDJWlCeem3sGMP/X8qQ2ykoZ1LD7Tfw
	WKRutI/3FSEZCj6GO40bDn3jRJDn+5w5n5f0nLOqkSdSY+0KZKmsGVAeJW0tmyvmob3eHk893vs
	xz/UHBnhhtjuUybDuJWlih6mzXk4cjZ5NTtL/tfWOFcKgVARzqJy4LKMuwuDY2+2CkbgO7t1vyO
	KngVKpBTLrik1AbsjX7sRY3edH4iMqP67i9iwoY9PkaEWliuk6Ncb2plLtNec+RrkPdUXDfNu7D
	f5+dg==
X-Received: by 2002:a05:6000:4210:b0:439:b1c3:84c8 with SMTP id ffacd0b85a97d-4515cd27a66mr5880843f8f.21.1778074962750;
        Wed, 06 May 2026 06:42:42 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm12542182f8f.7.2026.05.06.06.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:42:42 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 3/3] wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
Date: Wed,  6 May 2026 15:42:40 +0200
Message-ID: <20260506134240.2284016-4-nico.escande@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506134240.2284016-1-nico.escande@gmail.com>
References: <20260506134240.2284016-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_064246_236590_C61FA1B1 
X-CRM114-Status: UNSURE (   9.27  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This is similar to what was fixed by previous patches. We have a to
ath11k_wmi_cmd_send() which does check the return value, but forgot to
free the related skb.

Fixes: b43310e44edc ("wifi: ath11k: factory test mode support")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/testmode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index a9751ea2a0b7..c72eed358f6d 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -457,6 +457,7 @@ static int ath11k_tm_cmd_wmi_ftm(struct ath11k *ar, struct nlattr *tb[])
 		ret = ath11k_wmi_cmd_send(wmi, skb, cmd_id);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to send wmi ftm command: %d\n", ret);
+			dev_kfree_skb(skb);
 			goto out;
 		}
 
-- 
2.54.0


