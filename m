Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA94CC35FFF
	for <ath11k@archiver.kernel.org>; Fri, 21 Mar 2025 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5VXJFAwunceWjPEyTQ+PCn827vH/75sJz6UqVEsvbo=; b=sIrw3iHt14ItbVetbPGoAxAmRD
	JUjH/VKlQ4DiHOLx5sTfm95ei+ET4iMbzy4tjPTtw908azgSoOpmfXHK0pz5f9MBANHoDUBoeMPod
	vjAOEjOdpgrkoRyuVY8u2Qd/9Op3hC24UF+FnWBNSTtPS2Lfn6kau94nN5Y3VkcD5qaA1YciklvxC
	kjQUCJYOvHkNLf8QBXd8/I1c+OhnhO0qQUn0OZbOlRLtlRW/nUV2F5FFg21+oRY37Dr5OSQjWanaV
	w414Ulu60AJf774fpztEZqT1TARMllRX0kA3YdhjN9coYu2OFZQg7UaAiZ5UQYFdCD/RqyiddWMnK
	CH1UCNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZlD-0000000EXvU-0rGa;
	Fri, 21 Mar 2025 10:37:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZKd-0000000EU4h-1uPD
	for ath11k@lists.infradead.org;
	Fri, 21 Mar 2025 10:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E871A487E0;
	Fri, 21 Mar 2025 10:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651EEC4CEE3;
	Fri, 21 Mar 2025 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742551826;
	bh=YH7fJ3j+cxz0C85hFBF2iuhtOqEPJCUhbKdA9IRCfXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3UFHg53voc1NcSSosyBQlcYVGP2BnAOGZmo9ULUEr9fxMwUbemnjLqDJN0eB1mi5
	 fwQKQxMJvxvw3ZYpgl2kgoUN8+TIXo4251vri90DEwBa9iVb15wQycA8FPx7nZ6sHw
	 qxMImHkGk+Yrs4kBDrJpkaHRsvV88aYHdfJz08QQ1V+eIy2e54TUrvFa85bmN6VX3b
	 tPG4dKxm2pOr152PaDPH5fTY4ejiPP3K7ydlNZI8LVuEDrHXU4ayuvGAa+XssYu87E
	 luncr8XHXQBK1Bm8T2m+nBxt7fs6Z6M4GyGFNhvc0O5owso4K3VvB+sw0v2vlcDSPQ
	 ow4vpZ1EuXPIg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tvZKe-000000005Uu-2F5b;
	Fri, 21 Mar 2025 11:10:28 +0100
Date: Fri, 21 Mar 2025 11:10:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH v4 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z907FGWBV_MNlTcE@hovoldconsulting.com>
References: <20250317072036.2066518-1-quic_miaoqing@quicinc.com>
 <20250317072036.2066518-3-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317072036.2066518-3-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_031027_627021_01A49683 
X-CRM114-Status: GOOD (  25.08  )
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

On Mon, Mar 17, 2025 at 03:20:36PM +0800, Miaoqing Pan wrote:
> A relatively unusual race condition occurs between host software
> and hardware, where the host sees the updated destination ring head
> pointer before the hardware updates the corresponding descriptor.
> When this situation occurs, the length of the descriptor returns 0.
> 
> The current error handling method is to increment descriptor tail
> pointer by 1, but 'sw_index' is not updated, causing descriptor and
> skb to not correspond one-to-one, resulting in the following error:
> 
> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> To address this problem and work around the broken hardware,
> temporarily skip processing the current descriptor and handle it
> again next time. Also, skip updating the length field of the
> descriptor when it is 0, because there's a racing update, may
> never see the updated length.
> 
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

As I've argued elsewhere, I think this should be fixed by adding the
missing memory barrier which is needed to prevent ordering issues like
this on aarch64:

	https://lore.kernel.org/lkml/Z90yyrZcORhJJgNU@hovoldconsulting.com/

The fact that this alone does not seem to be sufficient to address the
issue on qcs615 (and qcs8300) suggests that there are further issues
with these platforms that need to be properly understood before adding
workarounds in one place in one driver.

I've just posted my fix, a version of which users have been running now
for a week without hitting the corruption (that some used to hit
multiple times a daily), here:

	https://lore.kernel.org/lkml/20250321094916.19098-1-johan+linaro@kernel.org/

> @@ -387,18 +387,26 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
>  
>  	ath11k_hal_srng_access_begin(ab, srng);
>  
> -	desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
> +	desc = ath11k_hal_srng_dst_peek(ab, srng);
>  	if (!desc) {
>  		ret = -EIO;
>  		goto err;
>  	}
>  
>  	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
> -	if (*nbytes == 0) {
> +	if (unlikely(*nbytes == 0)) {
> +		/* A relatively unusual race condition occurs between host
> +		 * software and hardware, where the host sees the updated
> +		 * destination ring head pointer before the hardware updates
> +		 * the corresponding descriptor. Temporarily skip processing
> +		 * the current descriptor and handle it again next time.
> +		 */
>  		ret = -EIO;
>  		goto err;

Your tests suggested that you always see the correct length the next
time you process the ring buffer, but AFAICT that is not guaranteed to
happen (i.e. if you hit this on the last transfer).

Johan

