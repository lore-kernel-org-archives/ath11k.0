Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024ACA1012
	for <ath11k@archiver.kernel.org>; Thu,  4 Sep 2025 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zx83lTm+FDte02e3FppN05MIMP6Z5zqC3JMzyNUwq3E=; b=I7qvoaLCKeexVNBANiDm+Lm87h
	x+jpeDVgIeVgres2+pLrBUGFkEsyjqTm0cJn14VrhvglPXtZ1/Rx8ZVPT71Tu2HhIy/whcDiNQjUO
	VYfl/9UNiV2QYpH+uAH8gr6is5g23O60mtcpJHCblI3VMtgtxCYSEhTzxOe9c2DBHBGpb+8sZQ/OH
	5yQmzXBBzGP3AfKAruYJ22ITf5qae3XimQYerHDcEqaDEZJ457TQpYMQm5nWwGEKY6gncKQi60XAY
	KE9CHWZfFqgAsMz1SwxXtW6vkNoQv/VZeOeRZXoYF3BU7HP7l/DFgkEia9ufpstDmGXm1r8wStgkn
	qpyTW15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7FS-0000000AuSy-37fI;
	Thu, 04 Sep 2025 10:31:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6BT-0000000AXJ4-0jpP
	for ath11k@lists.infradead.org;
	Thu, 04 Sep 2025 09:23:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so6035795e9.2
        for <ath11k@lists.infradead.org>; Thu, 04 Sep 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756977790; x=1757582590; darn=lists.infradead.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx83lTm+FDte02e3FppN05MIMP6Z5zqC3JMzyNUwq3E=;
        b=qD2hshBVy7p3QWNIXGf06a1hfS64jQaaj8/QWPrw5rhcBWiKyjB9DAiExeFkLc4pub
         2mqA1ozoi35/etCzVcWb26lKcYUxtsWt9VI6RE5lgfkckyns0JoqbdhULiO2/JhThzun
         coHP2BAS2T6rgrKgpjJRX+d8nW/gT9Wu9YhDBQ2oguYXZtTyYjS1TbF7l/pdWnanZ+wS
         Esbtdb2I1IMhB2miDXQi2gMOsF2w+wkpiZ5BnSzwvZW8ek1dqGuFnct0OcHlkaV9d/XV
         pnW6EV/sZAbSh9I3thcn8kCqYY0Okzqwvigax/zhkzI0P1MqZ5jlOMnTZpOd/6ktrBsN
         WyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756977790; x=1757582590;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zx83lTm+FDte02e3FppN05MIMP6Z5zqC3JMzyNUwq3E=;
        b=ZTT7h1bQOCWQF0a4DVA1AZljmOxcHovvzzO2Fjxymg1L7Iq+k+VdwGmDM8AUKbvipW
         Sbs5KWkHOEsPhoMWp2InhY6AJ5eeGlSbecM2/v73RO8dreL1XOJfSigFLyTJ2pce30WO
         EudN/5bbrcgAlYo1qZhVhOuNxTzdIJ1jqPC4EPaCfBv+1qxTZbpYynmAN+BlIDkiKo/u
         Tt2C3G5hSQe2AGIGnI6ZRIp6nOcpG6MAWdVzRof+Jh2guk0opPBeIvCamV5H26+8R7lT
         dLszsd+1Ug6JvJ4zEJSaFrLxY85NLqJQXzk6kAG1IJo9muedVOpc1qGHC8sJ5Pi/UEi6
         5cYA==
X-Forwarded-Encrypted: i=1; AJvYcCXRUeXfrmEnXhINyvWQvYfOluT2eoaYKwE5tDnWLaH6TKFO31nxsH2FrGk01aG0CWFTbiz/e9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YweQRYQLwbZLN6n3mOg6gY/U/3qj83sACbLBa2wPEJVlsZ3iedC
	qRj41hzr+4n6Ugvfxtk+pJJFJw8Su+p7cqeHLE4uECxKfkPhbPoleCL/pqSBcFK9IUlwhjDNWFG
	53zJK
X-Gm-Gg: ASbGncuNByHjnsYqeTKur2uNrzwEVmiJ+yrRuWpIL89RHW4deJ6/EnR2KDZMQIewpm7
	gQyMgvzkpYZkt4nbT4jC5P01IWaAwcVQJXIiF7o4R0+5VH0Rtc2ijPfkgIL38qQeV1vc17yC2RL
	bfzBvN6Kv129O5ASHXxpf2vXzS0mmxTM5/OFtptUQxEqNbtPPMjYVZnEfMhgawQ4zPezHFF/Je2
	gqjbjEnoB6alRMSCQKKPbdi86ZtLUnZkHmfXjmwLsEQ0zHxbm/MkJjnFNYYtlTUt2wSM3tFs4JO
	IXvT9pfpdaG74ETCxKic69QS6b+tAHnYCJ7kwG0Su1Hbv+wvG1A0WS4URWIBE5NlFWRBHSbUngB
	oY7l9vAXrHc3v7N4N+zRTOtW5YDfNcuKIyyUT3w==
X-Google-Smtp-Source: AGHT+IHbDgBpEVih0OWeNYjBFHGh3HVRMCoCH7tpGwiuk6sZz3Nfar/dPjqC5tXVM9a9iz2RPe9XBQ==
X-Received: by 2002:a05:600c:19ce:b0:45d:84ca:8a7 with SMTP id 5b1f17b1804b1-45da74cf485mr25153155e9.14.1756977789645;
        Thu, 04 Sep 2025 02:23:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45c6faad9cfsm87635225e9.0.2025.09.04.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 02:23:09 -0700 (PDT)
Date: Thu, 4 Sep 2025 12:23:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: [bug report] wifi: ath11k: fix group data packet drops during rekey
Message-ID: <aLlaetkalDvWcB7b@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_022311_217436_3DE3D0E3 
X-CRM114-Status: UNSURE (   9.99  )
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

Hello Rameshkumar Sundaram,

Commit 97acb0259cc9 ("wifi: ath11k: fix group data packet drops
during rekey") from Aug 10, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/wireless/ath/ath11k/mac.c:4459 ath11k_mac_op_set_key()
	warn: bitwise AND condition is false here

drivers/net/wireless/ath/ath11k/mac.c
    4428 
    4429         /* Allow group key clearing only in AP mode when no stations are
    4430          * associated. There is a known race condition in firmware where
    4431          * group addressed packets may be dropped if the key is cleared
    4432          * and immediately set again during rekey.
    4433          *
    4434          * During GTK rekey, mac80211 issues a clear key (if the old key
    4435          * exists) followed by an install key operation for same key
    4436          * index. This causes ath11k to send two WMI commands in quick
    4437          * succession: one to clear the old key and another to install the
    4438          * new key in the same slot.
    4439          *
    4440          * Under certain conditions—especially under high load or time
    4441          * sensitive scenarios, firmware may process these commands
    4442          * asynchronously in a way that firmware assumes the key is
    4443          * cleared whereas hardware has a valid key. This inconsistency
    4444          * between hardware and firmware leads to group addressed packet
    4445          * drops after rekey.
    4446          * Only setting the same key again can restore a valid key in
    4447          * firmware and allow packets to be transmitted.
    4448          *
    4449          * There is a use case where an AP can transition from Secure mode
    4450          * to open mode without a vdev restart by just deleting all
    4451          * associated peers and clearing key, Hence allow clear key for
    4452          * that case alone. Mark arvif->reinstall_group_keys in such cases
    4453          * and reinstall the same key when the first peer is added,
    4454          * allowing firmware to recover from the race if it had occurred.
    4455          */
    4456 
    4457         is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
    4458                              !arvif->num_stations);
--> 4459         if ((flags & WMI_KEY_PAIRWISE) || cmd == SET_KEY || is_ap_with_no_sta) {
                              ^^^^^^^^^^^^^^^^
WMI_KEY_PAIRWISE is zero so this is false.

I should probably write a static checker warning for code that does:

	flags |= WMI_KEY_PAIRWISE;

    4460                 ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
    4461                 if (ret) {
    4462                         ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);

regards,
dan carpenter

