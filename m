Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8AA606A31C
	for <ath11k@archiver.kernel.org>; Fri, 27 Nov 2026 23:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jKS4ZEqi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LJzDlxoi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nJLFwVyGSFKtJluQ0vECCLVVb0kUyc7qHJd4lZiWJM0=; b=jKS4ZEqirsEORmkFjUVwAA4TXd
	E8Pse7qqY+cy/JRwnCK+JkIQwhH2etvki7nb2vv0UI2FMWmNtO7h2T7vswplO1ip2m4be1ApLiC8n
	Czzcd2ifRgXRhaqjeCZIKIMozqjbCKIiZfGpemQxh4Rx8eTM4x9o3PXBRhBTsDB9oXRIqwHHfPqX/
	ypF9d7bhjoLX+8Q0bPqq2oBDgtbiGyev2XzLvdQxsUiWUOHrFJHK1iepeaFAQ7t0vSudNGvKQkG7G
	HNIgSLs/q8uhwPcvMSO9UhXjhbq5prORIa+hespcZWpEt2ZEYY5sTSjrFDhU4Qsc67ezbQhSijZ/M
	dh/JLufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5Qp-00000000C37-0aNO;
	Fri, 27 Nov 2026 23:32:44 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5Ql-00000000C2i-47UX
	for ath11k@lists.infradead.org;
	Fri, 27 Nov 2026 23:32:41 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso4777699137.3
        for <ath11k@lists.infradead.org>; Fri, 27 Nov 2026 15:32:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795822358; cv=none;
        d=google.com; s=arc-20260327;
        b=qwmqi34WBIjVHA/kZsjfapNua3IpgFsWxutcolb2BnbCCtb0YxMF56J/t/Cca+NKOH
         n/cU5LtDFypKAzYBsybCu84wllFi6sB89vR1hR7MMYS4mOa53lsZMgq8j3CTsE39kXZQ
         T23OVgF6OHhXaSTic1qJ2hYNIrcVaeUuYni2MZZrBduSlQ0ujjph6WFAbTFsecSbRfjl
         qNynPNggJHxdyNV/4+pL8/MbB8AGB0JuRj6+r1NYkTVa/lT1Jjq0UuLSF6150xnuInR0
         4BMIlXuBJL+LQHkvRmgT/PwsAcRdvDkcZyBjUiupZcfTA+Kft+VwuPN8s16jkczRYJUG
         uivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nJLFwVyGSFKtJluQ0vECCLVVb0kUyc7qHJd4lZiWJM0=;
        fh=0zNvcX+denZszGFmz8xoRTTwjKmbKW0moQluYYR9CPg=;
        b=V7SWq/xVVPVxkHfnvEgr+GVen/TN1Q6pgQHlW5tGBI1CD+1Pimro+zieR1CFn3sQfJ
         sgwYPj9F/8rGF3r1y3HHTvrgAdzyZ1MWsNgJlK3O1AbJ2zrV0zgl6V36DPIVgU/RZXjw
         zLd6+tdJYDCuvlX4Ou4f+XSZGVPxXKHU945ymrJsl1u238aeYYod2bsn5ZmzsDPRODe+
         rFE0PH0fXJmklO1KeySwTw4cqN2rftuNDKM/I+CyEdX4F3eFbMr8sT0zWUchPU7Q8eye
         JNZ6JlU7mcZL5RYYC4HD/aJm1yVZfxHf6jbNZzmRKBJL7TNo0mbOhsWWrWti64qGkA1w
         F5rg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795822358; x=1796427158; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJLFwVyGSFKtJluQ0vECCLVVb0kUyc7qHJd4lZiWJM0=;
        b=LJzDlxoipvTRa4HMCb8bH0pS0IYNqbpgCY4LLOdNSj9jEE9eVwY/9GKP+h/QCjojXt
         DTc23bri2CFJFfv2sLJAs3hsDF7WCH2iGHRpKdJmh41z3c3JtXmZLwMl1f1L07tf7fPD
         0lmuIQjLJI4Td+xj1dW8S+8DJ2sN3jeLSxRQuyrbR/YbOKJ+JyDN3zqSyLd+HuYvFZY+
         SsClL+zaVyFoVhX2tPKGUQkVxXt01FCuOoIVzFWXxFjMkqPF8CjTZhEtMC0SSjPBarpj
         6fkKwHLgRbQJ8AJ0hxcFsHs/zHfHJGPO86eUAA2bB9dH58iTsKeu1OKJXKEdecI/NkXS
         72ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795822358; x=1796427158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nJLFwVyGSFKtJluQ0vECCLVVb0kUyc7qHJd4lZiWJM0=;
        b=euXOkKqa8sW7dJCfRIn94zX7kU30Ag5rVvJWxys1UQ92WMKxals8BpwuNWmDkxP27/
         04e8n/qd0pxdYP129Zq27liXGMBK83okVyTljiS+VFffsaJHm3Ovpf1v8upkaFW+ApzO
         kF0LxC51Ap4SSg9sUJNMibqcVqQ8R+YHq80Ve60MkSn38t99sdRWRmygCfccLeB8w8rT
         niNdPTyOvBNMtgPV12V+mB62eajqfm0OjfYyjuPR0gLatNnVsdvQd73gGHc9RO7+o68a
         8Uu+N2hvrI4P2mDR7M7bSAubmAlPbwpvgaY1CFxjqqwq+w8Pr4AKAcSIfPTCAaJGfME/
         57VA==
X-Forwarded-Encrypted: i=1; AL+hErE+jRzr00uVxNP2mfX5zUdy+Ss+rbprMa8MBz+AsTNpLnfIUQuC2oska8vonzcqA81g/+t46Tc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9177y5bqmQUdXUUQq/ZLQ5u6uym3JbZM1a7zdCkLLy38bmUGLR
	ARNIDRSE6KBIBHAzM0GJyJTdRitcj058lZ4tfQWHziBWiAWtmdyI/9ZuFIeSQ3dugo+YTgEtVu7
	95ds5eHrhLiqagJB4IYy+v7iyqdQz+7Sbq1Qi
X-Gm-Gg: AZFdTZdEEJzVKXlM2dgsHEXHpLglTZRCQjQMBP34F0hmd+X97dbUcS7FFNSZhyhW4mr
	KUCUnmmwkwSka2CT/yj+mzB/h3wKuquPTyRHT18fIEAHLsHafNZSFkivXCdUHoojaOMb10SyR2M
	a5bGsV3XwOdfwRSIQSPowgQ2UYhBYjZmes80++BIl+VkDsLWi8wQD13pWDj/dWfz8XGDLpy9lWB
	rxcP/q0I5nkbvMgBcxv/kHOQTz5UlCUfQyaKf7ZnpZ3vpP1ySIoFLCU27jyf5kussnHM95Pfynq
	ggl7zIZYtXuu/uh6TxuTkGU+wM7j0GM1ycXMj/JawzMMU5PF6ocR+0tuNhW2WNpWOuzAAK7D86d
	ZXw6x3ZyAMLBT03RHI+K0/tRDUI+qz11XFzf4MDAz53WEOYur7LvvQCfLYbRBpMWuOySulkwu05
	mRyglzysN8O9jj24IKbg==
X-Received: by 2002:a05:6102:504e:b0:7c0:cdd9:31c1 with SMTP id
 ada2fe7eead31-7d73937ce2amr15746879137.12.1795822357816; Fri, 27 Nov 2026
 15:32:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAKobHXBuRr2Mz=yqFoqzQpeL9nY6ZeXY1HftEwyUxPYoDkS_+w@mail.gmail.com>
 <CAKobHXCMdy1YT8SO+kkZP9sCr+KOhOXU+if_r=_hb_5pgKO0mQ@mail.gmail.com> <CAKobHXBhqnB0c2gDEn+so-0AMFg5aj4pv=rEey9mCLHgHy-pBQ@mail.gmail.com>
In-Reply-To: <CAKobHXBhqnB0c2gDEn+so-0AMFg5aj4pv=rEey9mCLHgHy-pBQ@mail.gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Fri, 27 Nov 2026 17:32:27 -0600
X-Gm-Features: Aa3M54o0Cilpn-RiqwLvOGqLbPq-YK-n2NeABQpxrpOlU8rXz05Tgh__x2jX12I
Message-ID: <CAKobHXCa3z8WjQ_DAT0oMyOJ5rhzi9W44JK94zOcRnzvZ+==vQ@mail.gmail.com>
Subject: Re: ath11k: QCN9074 public firmware stalls at QMI cap request on C-360
To: baochen.qiang@oss.qualcomm.com, rameshkumar.sundaram@oss.qualcomm.com
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_153240_033812_A7BF94C8 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Baochen, Rameshkumar,

A follow-up with timings that narrow this down.

On the Arista C-360 (IPQ8074 host, two QCN9074-family cards), every
QCN9074 hw1.0 build in linux-firmware and quic/upstream-wifi-fw,
2.5.0.1 through 2.9.0.1-02175, never answers the WLFW capability
request: -110 after 10 s, no SYS_ERR, no RDDM, MHI stays in mission
mode.

Two other builds do answer, on the same cards and the same host:
- the vendor's WLAN.HK.2.5.r4-00683 answers within a few
  milliseconds;
- the WLAN.HK.2.15.0.1 build from my October mail answers after
  242 ms, on both cards and on every boot (241.8 to 242.7 ms over
  eight card boots).

A fixed ~240 ms delay before the reply looks like a bounded wait
timing out. The capability response carries the EEPROM read-timeout
field ("cal data supported from eeprom" in ath11k), so our guess is
that the capability path probes a calibration EEPROM. As far as we
can tell these cards carry no EEPROM; their calibration data is in
the board's flash. If the probe waits with no time limit in the 2.x
builds and with one in 2.15, that would explain everything we see.

The same 2.5.0.1-01208 build that hangs here boots on a QCN9074 in
another product (IPQ9574 host), so it is specific to these cards.

Could a QCN9074 hw1.0 build with a bounded EEPROM probe, or with the
probe skipped when no EEPROM is fitted, go into linux-firmware? And
is there an OTP, board-data or QMI setting that turns the probe off
in the current builds?

Thanks,
Christopher Griffin

The tests and this note were prepared with Claude, an AI coding
assistant.

