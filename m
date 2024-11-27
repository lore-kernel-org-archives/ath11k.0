Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF5DD6ACE0
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdBKYu59zz5dNnmAPo9hi/5rPJBTreSNmfq7NUIW5R0=; b=R8R62QWPKDblrkQVMb6AeBtj5a
	m1vklH7EH2ASs6WnkcyERhrEIcD9ojzlKZ3vDEbnKc9hastzFiRAHQTzOXinUDVEZgQZsATvBRi2q
	CcPvTPI34Ep7+BvNSuZThEi2KEcuYIZ4NDK2AHkX/gBJUQuQdvkpKKhtSN65MIT8WC7/eJd1/OtX2
	B4gbjA09O/dc3SzEMiYFHtj+HOhtuhiT6oGnxS2O9dOfnpsC2Ru33Xer7YM9UR703hB0/VeGNJrgE
	llMVeyNqeNLoT0IcJNd0Qb2OqkNT8lqbGkuSroRLkqW4BwuCIPkg+lnnid30obmXtwxI4lU9NuXFe
	ZY1Jzg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJ92-0000000DNXj-35vy;
	Wed, 27 Nov 2024 14:35:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJ90-0000000DNXP-3QsO
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 14:35:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21200c749bfso67577815ad.1
        for <ath11k@lists.infradead.org>; Wed, 27 Nov 2024 06:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732718154; x=1733322954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdBKYu59zz5dNnmAPo9hi/5rPJBTreSNmfq7NUIW5R0=;
        b=egnG99wIbsvqZUL9dlGe6frlV2I5mXw/zIg1wiDnxSoCGK89z1eL9ScWJf/ZMoe3Xr
         7lG870BDVRxLDd+MthwCO92/a0odY4dGHt/82iRmrD2vbECBJQdOwPG5aTLx3rY8OkJ1
         /0cRXKXBSFudReT/ztqj2mVJSRbSyH+VdbwQfbndzJhbuhEJNFfhv0LsoPrFzjJA48Yi
         Au/WIFSuCxNufMeCxhhdHICh4acSHYNcciWUseEs2f+Sf/NqXWNEolX08iTOlia4VSJH
         wnPTmtJxuNx8b7d+D9nawQ4t9vTSktTg7xzQgQFooZ9w0eedJ1jChNmPUbCzk4VsN1Zk
         O2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718154; x=1733322954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdBKYu59zz5dNnmAPo9hi/5rPJBTreSNmfq7NUIW5R0=;
        b=A12zJWz/Jc0Z9A1r+5veJPS/7J5h8kpEhjMUj79IEeeFP6TTdE73AePdQIk5aKAKKw
         aZRjdKmp872phIf10gHvglKRTm8mqiAquODW82PycepxkvB9iZ4l8tISiJ0QWxXubeGT
         CR55zhB51+VM4Tl+XlOWvVWkD9WJ2+0vDOC8E6pRZQtQcxMFdWH09fUoQmOwiOCkKOeH
         T58xsDdfNZZpAk9KsAEvaMblYc4RD03WB3gfz1yhfXG7/qN3apMrOtzLIYOlbpP9QEYs
         uFyR1JuGXcu8fnA+xZuKyd9Mc4UBHX4HMDnBzCVuwRPOuH2EZ3fiQncnmfK1BczMWuBc
         L/9Q==
X-Gm-Message-State: AOJu0YxMk9omchWSUhV9wMwkXPpr+sjJPbOgLVbTseq6MWuNtnjU5Chp
	/FPgRzRWE8agBVPK60GaprfAkkju9F140weGESLZnyBBOU6DtCAN
X-Gm-Gg: ASbGncswzXGGObaHmOLBX9s1HnrNa5w+nanqR1QNO6IR+Cr4izgcXctCwgob1Y+ZH2i
	LDvh7hdl+QUaKQLt8yVKk16LnXSDJ4IhHu58coiECB1LuJ/yIg/iKkfNT0fxesq2TtzFmcSCgRv
	x5+EkRUNWiPLwWtYafuKreK6vPQCW8DRlhERRYxy4aXFl28oZ8imcxcTUynJcWaj/V2g6RhjeTw
	fu0ZY0cNK/FUMVq3/HscXVAN6N4DAjhaQIF/V9fMkZrgOxAI4pKzGlvERk=
X-Google-Smtp-Source: AGHT+IGHyfCyr8T1DrDbozg4fFTa7y3qsmhyeH71De1a2eJmZ1ljjREFI3OAKgjsu9qkdKeyCPsGcA==
X-Received: by 2002:a17:902:e881:b0:20c:c086:4998 with SMTP id d9443c01a7336-21501f622a5mr27261175ad.55.1732718153136;
        Wed, 27 Nov 2024 06:35:53 -0800 (PST)
Received: from localhost.localdomain ([223.72.121.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215150adb5asm5101175ad.258.2024.11.27.06.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:35:52 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: markus.elfring@web.de
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zghbqbc@gmail.com
Subject: Re: Re: wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe() ERROR code
Date: Wed, 27 Nov 2024 22:35:06 +0800
Message-Id: <20241127143506.28267-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <30b208e0-55a2-400f-9638-1765e7ed3bfa@web.de>
References: <30b208e0-55a2-400f-9638-1765e7ed3bfa@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_063554_874908_EC36AA8F 
X-CRM114-Status: UNSURE (   9.12  )
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

thanks for your reply

> May the detection of a null pointer for the data structure members
> “dest_ring” or “status_ring” really be interpreted as a successful execution
> of the function “ath11k_ce_rx_post_pipe”?

i submit this patch just want to ensure the last codes after
`if(...)` in `ath11k_ce_rx_post_pipe` can be successfully executed.

There is no error handling for NULL dest_ring (or status_ring)
in other funtions calling `ath11k_ce_rx_post_pipe()`, because it 
would return 0, like successful end.

I think this patch can not change so many codes in other functions in
ce. This may involve a lot of error handling operations,
and depending on the severity of situation, the driver may even
re_setup the ring.

I will submit a v5 patch, and in that patch an error code will be
returned.

Baichuan Qi

