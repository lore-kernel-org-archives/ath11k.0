Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D14606A33C
	for <ath11k@archiver.kernel.org>; Tue, 27 Oct 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aeWk8NsI;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JdHZeNPL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cSQTlLG50jQwGPTwtgCEXwH2UrPpxUH5zGtovPPmNz4=; b=aeWk8NsIDvPbEB2N5VORYxmn9t
	IADt4NkSUDSVrCHZoC2AGyotj/Bhv2qow8tEjKDsTzxrE9lKX016tAW3dFJwptO3wKi8NwZXlM1Ma
	0PIoLnj1lV7Z+Cigu+z92LbHxPj7WSIgsjCtsq0Vhds/z4DllcjPWWYNqu1/ueGExLL+9cvhzc9V8
	z0aO2E/ykA5o1dy51rTX6VhsNVBT9rIZaEa0ZVX/2+ov02BtoLMntzhurq0ZrZjkr18W2QzaCS4FO
	hetVlY8TjA+ySfNy2zvTwxzvvByqnN47/OXk0O9ABsEX7U8cYQckrIVgiJm/pHlWdcpfxKj8E6dOF
	uJrjYhoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc29-00000003xOK-37aq;
	Tue, 27 Oct 2026 07:55:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc27-00000003xLy-1Zjj
	for ath11k@lists.infradead.org;
	Tue, 27 Oct 2026 07:55:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so6544030a12.1
        for <ath11k@lists.infradead.org>; Tue, 27 Oct 2026 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793087745; x=1793692545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSQTlLG50jQwGPTwtgCEXwH2UrPpxUH5zGtovPPmNz4=;
        b=JdHZeNPL0c01smxqFZlivUNCsusCuJSRTNdb0xqHQrp+b5hvAKh796d/xZyt5QH7eS
         5xrwT6sTFyftY7CBo10WfBFvlJt4DIdT8rQgpXMGKT7DI1D5XuR+qHdqkchYKWhF7g85
         JS3FSukuxiqBRMCybbw5bb7WKrJ6KftEGoPpfzG+DXtiXiLHIVHngn75914G8k1xKnrk
         pI0QL/8zr5qHvl9XdHi6ndLj/7RCDlgEzJLCK9GzwiZLbA3ffgHtpAJSgiaDKzPh72hN
         xpCu07DmJCFCMGnpidTFdDPU+zCG1P8bIWop2AS6mbXZQ4gBE5zbipJc2KVTmh9ctZZ0
         fELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087745; x=1793692545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSQTlLG50jQwGPTwtgCEXwH2UrPpxUH5zGtovPPmNz4=;
        b=ftV+PKGZeS02QqmkiYs+8uAIdUx8WpVtZpojeKbBxhv00fWrEzMXUvqPjmvdDFqgIL
         Rdn07OxaFFcZ8FCL9liBYfeCZ8v/lkHtyMaHR97oIyD2VoavXTPRg9WTYQqSuuExatkc
         MYxemjlgC3PKTDMkArKgpg+TuDxEYiHxFRzvP8jIGCXT+8MyySHfiRM+ZIzx6ublWvtL
         ZvpLBcqK58XoFH1Y0e7PiGh4Q7KE1P0FIWGBp8jQ9WXg5MNqmi5l3r61a51y3pRnRVFc
         CgoqJrxFYlCjM/im4rS9vvV0ljSP4szGlQzx9H5p7CEYGQHpqrDXd0nWHMuis3Hp+4X2
         iv9A==
X-Gm-Message-State: AFq9FYLBN67jYU1+8G9rG+lmYNX1K4/1e3x1tIkZBuzlchMZ0sJ6sRYD
	4V5CEhc0l7M61j7HnbkY4xToG3nE8LBUc2CYzPakUpB69p+fBL7lycgm6uSxuioE8Q==
X-Gm-Gg: AYBFou0BnMHUYrBlLI7tsUvYGKi+uajjxnb9zddvcI8sV9jB2dV2bgIxW+tTTZw5cB6
	4plndVB3eqGdlQmfwcUCdWKEZ1cuIatCQwpTlIusHKHGp3bpfCePzNLoM5RVEMTu/LtGb2l/Vpo
	4GlMNOaEt5pp+aubOKkCo86MvpcuY22pVC6Gi3Ca1QGsTn0Jcf679+MdQd9ehJYRW9HDJWIWjnu
	N8GYMJxVctMijgdgstIYQEzEjutiY2b4ALsuTRM3hyBSZR/fVjMd0FZr6xsUeaedofSET2mj4fM
	SU4VKDews4/6YhVp67UBPolOCXzD4idaEl+MD+MdTcTHdFBHC6H0pYY6czehiXtZnZWAnUla9EL
	iRlH0dZcoTf6141HFdu7i77GpO3pxXPBQatJcCqvpo15GpfMEi6dXyPOEJNE1a8omvKHHKPYtqk
	PNszwTDzG3wp08q+JnoBNlYF7S8Gb0cFPYaB8jiWeLvs8qK1takDlEV9phuk9Wge60L8FjNTdUc
	3ccd3GPiDlZTwMEpnCZrnm/Pc5IOJQYIBoRVxPwL5O44f39Z2GLKZ/GTq+bhzQhd0mVMB+jk/TH
	DJtGzoP7ijxxhvmr4DcNZKYFxUTnyJxzkADXXJwSy8m3E9aXZBrF2A+Fn7ddvPqRwwtp4fhqCs3
	yVH661e2sqIfxx/2L8Dlbwcty+j/CjNbUYAZFj8YAuzZVEdnfsgitOwPcdHhdOa7MIEB0MlJ+43
	m8DR6eEy25HZDHXJ9Hy0Ngpii9y4Qi6ZFM8mOXeNchrKlUe+CqK54mzMoVWjxQp6y2uUmA1TCDf
	RCzV5+rHgtGz8O8ERyI+f6ZmCV6HQ==
X-Received: by 2002:aa7:c405:0:b0:6b1:c930:652a with SMTP id 4fb4d7f45d1cf-6b442fcbaf4mr7007086a12.7.1793087745215;
        Tue, 27 Oct 2026 00:55:45 -0700 (PDT)
Received: from Desktop (pd9513dae.dip0.t-ipconnect.de. [217.81.61.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4669251a12.19.2026.10.27.00.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:55:44 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH ath-next 0/3] wifi: ath11k: select the hardware mode
Date: Tue, 27 Oct 2026 08:55:41 +0100
Message-ID: <20261027075544.19144-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_005547_446969_7A773A27 
X-CRM114-Status: GOOD (  10.18  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k always takes the highest priority hardware mode the firmware
advertises. On the Zyxel NBG7815 (IPQ8074) that is DBS+SBS: three
radios, with the eight 5 GHz chains split between two radios and no
160 MHz. With Zyxel's own board data the firmware also advertises DBS,
which gives one 5 GHz radio with all eight chains and 160 MHz, the
layout Zyxel specifies for the board. There is no way to ask for it.

1/3 adds the range check on the firmware's mode IDs that ath12k has.
2/3 drops the regulatory events the firmware sends for phys outside the
selected mode; with DBS on the NBG7815 the event for phy 2 hit the
WARN_ON() in ath11k_reg_handle_chan_list() on every firmware start.
3/3 adds a hw_mode module parameter; without it nothing changes.

Tested 1/3 and 3/3 on a Xiaomi AX3600, whose firmware advertises only
DBS: no change without the parameter, and hw_mode=0, 4 and 7 warn with
the advertised modes (0x2) and keep DBS. Semih Baskan tested the series on an NBG7815
(modes 0x12): hw_mode=1 gives two radios, the 5 GHz one with eight
chains and a 160 MHz AP, without the warning from 2/3; no parameter and
hw_mode=4 give the three radios as before. Both tests ran on OpenWrt's
ath11k (Linux 6.18 with backports 7.2); on ath-next the series is
build-tested.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath11k: skip unknown hardware modes
  wifi: ath11k: add a module parameter to select the hardware mode

Semih Baskan (1):
  wifi: ath11k: ignore regulatory info of phys outside the hw mode

 drivers/net/wireless/ath/ath11k/core.c |  6 ++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/reg.c  | 14 +++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c  | 25 ++++++++++++++++++++-----
 4 files changed, 40 insertions(+), 6 deletions(-)


base-commit: 2c50cd5d10e8723797f28c7978f1f61688e0c0d2
-- 
2.53.0


