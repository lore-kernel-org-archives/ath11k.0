Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A7AC433FE
	for <ath11k@archiver.kernel.org>; Wed, 29 Dec 2021 01:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhrcrwFgUCLYe6sAlaGUH5+1ZbD2f+RazKbwZ986ISU=; b=rMAudp6rYxiVqE
	J69u+1qms6TenljQifoRc7gPu5e9euHTS3Nips8O62tB5KUqNMA3q1A3dLRx0RL/1OVgWFc/Z2dAa
	usHpRoSNrMzCfwSHe7DCYyrb8+U+ehgVPKEJzkpHQqRq1cqrqZNAvhKTS0thJPcPiS7Vtj/6tdtbi
	b6c0Y3Ny8eou2odhBML6uJ773/r32zcHzWq8P6oFS5v/0TZYuXR2fNI79WzvhxB44vZgl7j2jM5rZ
	7CjrQeyVLI7eMSjBpHo9RLnZUF9N3ku+IYQt3ze6S2THPx+gvUBofaQzLP6WljqvNOPo4F3+3p4d0
	u0ImEq5sEFRtazJ6XvJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Nqm-0026NX-Ax; Wed, 29 Dec 2021 01:33:56 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Nqj-0026Ln-Ow
 for ath11k@lists.infradead.org; Wed, 29 Dec 2021 01:33:55 +0000
Received: by mail-vk1-xa31.google.com with SMTP id x17so10385434vkx.3
 for <ath11k@lists.infradead.org>; Tue, 28 Dec 2021 17:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IBcil9O+VRrBlwSK9WQFnnXvi87jfhzw0Yvv4tQzzQ4=;
 b=noDIEQ8P8sUYyX/OE18Q5FGCEdOtXRbYUWogiKJXUl19FWceFTLSzy33NO7370WsVb
 xNtywJS1aHmXYo/ZkLPfxpKAuLKxK4YE+eVz8VTkizITqKtfycFbgYZ8mkgMJWEJt21+
 SNTUf5JrpwvWrXhCSoo6DxEmJYz1lYAcgrZn5Siak7Xevszf8m10NCTaN+zXiqI+KIS/
 Eu3eNT4oCfEFd0fiD/WXOlhQ5EblQr9RpaZdLMvylKbA5ymBdmZHyFsCK1nxmVisoAn9
 uYVylo+Wo6Qmr7pTJyQxMeOn82Ns+dOHizKeng6bH3WIfBKj/q/NPdRFTbbgDlFIWhAW
 0Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IBcil9O+VRrBlwSK9WQFnnXvi87jfhzw0Yvv4tQzzQ4=;
 b=o1RhkDoukGalm5d0qu4XMu2fvcS7cMlO3KaEqAczGthZ3QDgxud85chFaHThA49eIi
 yskCwO95BdPivpD4dYLBocsWD3hMso4fzdATo0TC9qM6zhcRAUH1yGU/cjPKfHUUIyvD
 s9nsgusCSBI5W18jM/gZAs+YdLHrmG4vmeMWskjWiS4zjKlS2cCoMVMxjejlz3ceR3Hj
 hFRbn/0sMyCwsGWOwK8f+Exn8l3wdETEIojnK4ftrtzADursf6gmdjUMSHeLxLlTOa81
 gpfR/4bb+GgySEkGHGZlB+Cu81We9/kyDDYIG9PR91ApDS15G0ZMewxjC5ysr085smPB
 OiQw==
X-Gm-Message-State: AOAM533NyoIpQs7HeNUoIY611dj/rO+gPsiWtNOFToSu6BbySY1ZSOaM
 htbIYwoxcLbJpfItGSjwlIQ=
X-Google-Smtp-Source: ABdhPJwKKoiH34wYig8kLDUOCk3RH8x02XOvCc3/C+ewf+rsM//1r3lSXc1Bk8D6hTuZbPILWEIFJw==
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr7411735vke.33.1640741629056;
 Tue, 28 Dec 2021 17:33:49 -0800 (PST)
Received: from [10.230.2.158] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id d15sm3964460vsb.18.2021.12.28.17.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 17:33:48 -0800 (PST)
Message-ID: <5a82690c-7dc0-81de-4dd6-06e26e4b9b92@gmail.com>
Date: Tue, 28 Dec 2021 17:33:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from net/sock.h
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, ast@kernel.org, daniel@iogearbox.net
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, marcel@holtmann.org,
 johan.hedberg@gmail.com, luiz.dentz@gmail.com, dledford@redhat.com,
 jgg@ziepe.ca, mustafa.ismail@intel.com, shiraz.saleem@intel.com,
 leon@kernel.org, ap420073@gmail.com, wg@grandegger.com,
 woojung.huh@microchip.com, andrew@lunn.ch, vivien.didelot@gmail.com,
 olteanv@gmail.com, george.mccollister@gmail.com, michael.chan@broadcom.com,
 jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com, hawk@kernel.org,
 john.fastabend@gmail.com, tariqt@nvidia.com, saeedm@nvidia.com,
 ecree.xilinx@gmail.com, habetsm.xilinx@gmail.com, jreuter@yaina.de,
 dsahern@kernel.org, kvalo@codeaurora.org, pkshih@realtek.com,
 trond.myklebust@hammerspace.com, anna.schumaker@netapp.com,
 viro@zeniv.linux.org.uk, andrii@kernel.org, mcgrof@kernel.org,
 keescook@chromium.org, yzaikin@google.com, nikolay@nvidia.com,
 jiri@nvidia.com, wintera@linux.ibm.com, wenjia@linux.ibm.com,
 pablo@netfilter.org, kadlec@netfilter.org, fw@strlen.de,
 ralf@linux-mips.org, jhs@mojatatu.com, xiyou.wangcong@gmail.com,
 kgraul@linux.ibm.com, sgarzare@redhat.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, arnd@arndb.de, linux-bluetooth@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-hams@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bridge@lists.linux-foundation.org, linux-decnet-user@lists.sourceforge.net,
 linux-s390@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, virtualization@lists.linux-foundation.org
References: <20211229004913.513372-1-kuba@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211229004913.513372-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_173353_820768_4001F958 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 12/28/2021 4:49 PM, Jakub Kicinski wrote:
> sock.h is pretty heavily used (5k objects rebuilt on x86 after
> it's touched). We can drop the include of filter.h from it and
> add a forward declaration of struct sk_filter instead.
> This decreases the number of rebuilt objects when bpf.h
> is touched from ~5k to ~1k.
> 
> There's a lot of missing includes this was masking. Primarily
> in networking tho, this time.
> 
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

It would be nice if we used the number of files rebuilt because of a 
header file change as another metric that the kernel is evaluated with 
from release to release (or even on a commit by commit basis). Food for 
thought.
-- 
Florian

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
