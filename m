Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CA6606A31D
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 21:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RhmF6U+G;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Hmvf0HyR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=; b=RhmF6U+GsF+kGm
	akoDonf9/vTxpfDE7AnX+tYK0u92xK27wGszHw/6cBf3IYaQnxF3iy8cIGAKMrTEmCibcfwFsU9x7
	JZmi9xrBBSzfGX/YppikTxtQ2iw4usRddAtlq0tZVRXi0LQHQ83SI/9iT/TnHnYu2z9DOgop/7YY4
	yrRmH3eDU84eR3qCgPQs+wVr/ZonHikAPrIZfzT6ulr46N5jLX/isnYs3uWyppRoVnrEfRGiNa+XP
	ouVHc4pJ4jd5mmfM7BbyRcEns3NQzoUUChZOHGONsqzDnJSuoAqeFSYrnmqh/NI5Ma4BZhrDARL1p
	3plXeuQ78I4PyZWNp+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEsA-00000001mJe-1wja;
	Sun, 22 Nov 2026 21:13:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEs8-00000001mJK-0VV5
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 21:13:17 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so4218836a12.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 13:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381994; x=1795986794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=;
        b=Hmvf0HyRlUr+qXU2IziiuwkmxSbQGZIsBdGGfjBiWLWh5TcF9wPsQUmS8FDV3ovT7i
         HFjfOXnBzb7wf9xh3WP2xIWLlNmphk3EtzT+snqo6+8RMD3d9t//4FZj6hlOjjvudiZw
         STidx22RlU7KTehhHJf+aOoCKoYozPYdRHwzRgFwp/9Ijgm+cMrmg3yACkT2Yj3XEkp3
         J5b6a9AufmHFM0dA/fWkAPZfHaJuzrxcUyeYTlUCMaSzmEE5Kb2w045WAQMJZqnuikMy
         mF9yOGkC9YkqDripFE9fZEnuwjc8OStZw14cxefEE6t9Mjo30Q3R2uEfz+bhNO1rTwFw
         vq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381994; x=1795986794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=;
        b=uDuVUQX6VM1rAQRRZUlsdpKnfJHeQ+HCnixXFZunyEm2tKUNYFA0INaiP4vnugMhlf
         L1rhhYb/feGadwIJpuYD0t6q8wng9ps5X0SuaTcNpJgIjeGKFAsHvmiGyxeTjvHyA+uz
         0S90wt9+g0TgjR2MKVaUzEL4OcLzQB78Uo66otdi80lTYP7K6XXI9TgIgVIxm0OWRs/w
         kHAsXxjqLvZDjzgFqxrbGJEV+ZNWM1W5ExWs6v1eoJC2GOpEYl2KSsV6DvPIlouWKu3m
         K9FOTrWcUOyWTmJwUbLRLAKqX8JhgEfIK4zplO47SK5wsVB9WqmInZ3ee8nhVSgbr0Ts
         0MGA==
X-Forwarded-Encrypted: i=1; AL+hErELPTxbAhCpGpMAk0PUf182NH33Ilk2msqw4L6ujQ+664E9D2nOWoTmR5ENI0SVdhiBz0cT00g=@lists.infradead.org
X-Gm-Message-State: APuU4Z+eVHIX+JcFmA2E+RsLTGgYOI/tEvMYHdJQ/T7h4ZyTOYHizaak
	4NS0dXpMW2qmvZ1llya+kIT93JMh7hXDWRDgOiwYplPV0rqGtO9aFlTSjRP3DXqgEQ==
X-Gm-Gg: AZFdTZevcVIfrK7mr7edv8rUHx+zGf6z75JKDYwiZj8Rz9aR90JlQyJ7nGDIpJGmcS3
	D4gN35PbljIIs47CDbpHZ9gUZUz6JMFLtZ8s/1m1FmO94N4X+z1p2VG4l2phsIPCLyaOWx+5JXf
	L0vtOlkXBbjE9bNXDWdpvUUxOjNbzPIGsG57DhP4J4z1Byx7relI0OCrTNLnlB4VhCpX6joQowY
	APgDuUCh2GAokZVr0WFjSNQIP0FBM7cKMG2hz4S21lX5V7p4Ob+fwo5X9wNDgJxNxPRutHs9/LV
	WQiPbdyyPuenvxL2Ibr5WY3xrbDwFw4f/WXoDSsTt1rBSq34zXOKDkEzgFQREbN9dDk0qpO7+FP
	ZwNiSrmSRY3da9gK+Huz3nnZLpBamDSSlXbQ649MZR6KqVKZsAnPv8H8S8z2Ug9tDmXaI8ZjTWR
	09hbOHMS3F6p/fEUivd9yo1E67xtMobqMQkZUGDHuKE9KI67oEAkzG4dCZ3Q1c5Td0o4T6rRx+e
	wF41Do1LNzA69HLCg3PsY/sIpJxn6N2F7sieZtjD88KWoSYSImiQoFrwFeLHbRKwqilyrIpusmh
	Fu+cboH9VAui2I9kUf+KWwQ77v7gpLIgf3ce56FbUIHAk+43XP6qprEmVfpjVON03Gji7ij+WmQ
	Ni1bjrBG4/o+BzhiBbHHkLbO89LKpdSRP/ROOc24nYg87j7GOXvmwEBQh4WJaebFHAR4uj6MSIx
	8yWNZW6irUu52xlYHVypjfDSyjfu84FHYGJmxxUsF5GUQb6uw9CzoS1Ple86v363J5n/eKOeC+V
	xLx7oCtr7z0ABM0YtFVdpF4G/wsI5lmZA/FvLjS52O4ylMSJxQGEQFXKqtdIjRJNL75per1WhE8
	WZXNX/5QKHO34xVxq8o3Q5Fso6hCGq2nZbOFQOrat8q7fVw/969wJ6pe3U6RkLAW9TOetAsHiw=
	=
X-Received: by 2002:aa7:da58:0:b0:6b8:6d68:23dc with SMTP id 4fb4d7f45d1cf-6ba37d51f47mr4295989a12.7.1795381994095;
        Sun, 22 Nov 2026 13:13:14 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d50069697652bafd0866.dip0.t-ipconnect.de. [2003:f2:4713:d500:6969:7652:bafd:866])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm4245663a12.32.2026.11.22.13.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:13:13 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	john@phrozen.org,
	kvalo@kernel.org,
	nico.escande@gmail.com
Subject: Re: [PATCH ath-next] wifi: ath11k: report TX retries in station statistics
Date: Sun, 22 Nov 2026 22:13:14 +0100
Message-ID: <20261122211314.2143272-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018171803.1545946-1-julius@bairaktaris.de>
References: <20261018171803.1545946-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_131316_196401_3DC0EC9C 
X-CRM114-Status: UNSURE (   5.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 18, 2026 at 07:18:03PM +0200, Julius Bairaktaris wrote:
> ath11k does not fill NL80211_STA_INFO_TX_RETRIES, and mac80211's TX
> status accounting leaves it at zero because the driver reports no
> per-rate try counts.

Jeff, the patch still applies to ath-next 1983b40acfcb. Is anything
missing before it can be taken?

Julius

