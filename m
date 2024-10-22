Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07365D2CDFA
	for <ath11k@archiver.kernel.org>; Tue, 22 Oct 2024 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2smzVPm4+QZVvNeqgZ9J1sILSVzFs7f9d1zxoh2CEqQ=; b=oUWXKyyENkX7HoSdsg0+tMBfiO
	h+7QSm0i8K4V8CuoT7aMUb+1mdA1cazHJIk4JuJZ0hughCXfBZ91Vk/mwjmodEheLYcr0vAToRuzx
	KWoBfm0j3/Rb0H6n4UnCnDe0MCBlcoA242IGo8HnBb6w7BIwG+7QohD34lFrak0si1hsJIrYKGDzo
	uU+Va4Y5FOt54KVDY+z1y/PBeFXzuVLFQFetpCEdsjRgkUcOe/RWwXWhBDwogYOEmynfLNkR4GYPt
	94Pd9HhXDwappe3Y1oLUx2TtM7VDjT+dlTTMkGIPDSY8NpaHehoiQGG/KeKiAvwBDl75Ezm3j2Yjv
	zGoi3SVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3HHi-0000000BLIU-2AA3;
	Tue, 22 Oct 2024 15:59:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3HHf-0000000BLHu-0oFC
	for ath11k@lists.infradead.org;
	Tue, 22 Oct 2024 15:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F8C35C5D29;
	Tue, 22 Oct 2024 15:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554D6C4CEC3;
	Tue, 22 Oct 2024 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729612737;
	bh=u7X7plqkp/9v6wNfXVOJrFtOm4tT8rm/aCvTWXXbSto=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AspX8KV3W7y+CPHHYvlAnMWXh8T/2zUCEqAZRcHn5f4474HiLQKiz22JIry6GiOOm
	 zsQfWc7hhNh7Ot4a0BSr8xglApKye7szdZmjpf7azWfXuXrh9P3+WQT/RayTL/J2gL
	 pnkoLzdonbb4r3KnrzhmCRPJoZKZOmQ4D1YHZgLvVsZq9fd9v4C9GCyKjOSdY0IXnK
	 gsSiT4I7cK+rFF50p7GdijoXLLrxP2GDuBcDZT/7A5GLpPnUMN0LrnZeccwcGT/TER
	 0+SpKJUCx8gWr56ELXTO8ilXenaWWZ/G40ELUuW3Z352zsd5fxY1c3rA/43lxCnJzh
	 5UvbFgJ5JlExw==
From: Kalle Valo <kvalo@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  <quic_jjohnson@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] wifi: ath11k: add firmware-name device tree property
References: <20241001033053.2084360-1-quic_miaoqing@quicinc.com>
	<20241001033053.2084360-3-quic_miaoqing@quicinc.com>
	<smgbishqbin4kcpshqvue3ivvfko2l6rj2w4ikwydosbkq6kde@pdbzhklj7znm>
	<1c5f5c93-db06-4490-af2e-bbce2d184c94@quicinc.com>
Date: Tue, 22 Oct 2024 18:58:54 +0300
In-Reply-To: <1c5f5c93-db06-4490-af2e-bbce2d184c94@quicinc.com> (Miaoqing
	Pan's message of "Tue, 22 Oct 2024 18:20:50 +0800")
Message-ID: <87cyjsnn7l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_085859_296823_377DFE50 
X-CRM114-Status: GOOD (  10.64  )
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

Miaoqing Pan <quic_miaoqing@quicinc.com> writes:

> On 10/22/2024 5:57 PM, Dmitry Baryshkov wrote:
>> On Tue, Oct 01, 2024 at 11:30:52AM +0800, Miaoqing Pan wrote:
>>> QCA6698AQ uses different firmware/bdf/regdb with existing WCN6855
>>> firmware, which is customized for IoE platforms. And the 'pci-device-id +
>>> soc-hw-version + soc-hw-sub-version' may not be enough to identify the
>>> correct firmware directory path.
>> Why is it so? What makes it so different from the existing platforms
>> that you can not use WCN6855 firmware?
>
> Just as I said, a new customized firmware for IoE devices.

I know in Qualcomm it's common practise to fork the firmware multiple
times per project and what not, but in the community the preference is
to have one mainline branch. Having different firmware forks/branches is
a lot more difficult to maintain.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

