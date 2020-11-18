Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfRWx-00058B-4Y
 for ath11k@lists.infradead.org; Wed, 18 Nov 2020 17:46:08 +0000
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 09:46:04 -0800
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: [PATCH] bus: mhi: Remove auto-start option
In-Reply-To: <20201118115757.GA5680@thinkpad>
References: <20201118053102.13119-1-manivannan.sadhasivam@linaro.org>
 <877dqjz0bv.fsf@codeaurora.org> <20201118093107.GC3286@work>
 <16c430bbd5117a35496f85f4454095b9@codeaurora.org>
 <20201118115757.GA5680@thinkpad>
Message-ID: <1b5eb02e78b3b68b88dd3d12e3f8c60c@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: bbhatt@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, hemantk@codeaurora.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2020-11-18 03:57 AM, Manivannan Sadhasivam wrote:
> On Wed, Nov 18, 2020 at 07:55:19PM +0800, Carl Huang wrote:
>> On 2020-11-18 17:31, Manivannan Sadhasivam wrote:
>> > On Wed, Nov 18, 2020 at 07:43:48AM +0200, Kalle Valo wrote:
>> > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> > >
>> > > > From: Loic Poulain <loic.poulain@linaro.org>
>> > > >
>> > > > There is really no point having an auto-start for channels.
>> > > > This is confusing for the device drivers, some have to enable the
>> > > > channels, others don't have... and waste resources (e.g. pre allocated
>> > > > buffers) that may never be used.
>> > > >
>> > > > This is really up to the MHI device(channel) driver to manage the state
>> > > > of its channels.
>> > > >
>> > > > While at it, let's also remove the auto-start option from ath11k mhi
>> > > > controller.
>> > > >
>> > > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> > > > [mani: clubbed ath11k change]
>> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> > >
>> > > Thanks and feel free to take this to the immutable branch:
>> > >
>> > > Acked-by: Kalle Valo <kvalo@codeaurora.org>
>> >
>> > Patch applied to mhi-ath11k-immutable branch and merged into mhi-next.
>> >
>> > Thanks,
>> > Mani
>> >
>> Does net/qrtr/mhi.c need changes? I guess now net/qrtr/mhi.c needs to 
>> call
>> mhi_prepare_for_transfer() before transfer.
>> 
> 
> Yes and the patch is also applied:
> https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/commit/?h=mhi-ath11k-immutable&id=a2e2cc0dbb1121dfa875da1c04f3dff966fec162
> 
> Thanks,
> Mani
> 
>> > >
>> > > --
>> > > https://patchwork.kernel.org/project/linux-wireless/list/
>> > >
>> > > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
It looks we forgot to add the mhi_unprepare_from_transfer() equivalent 
in the remove().

Will send a patch for it today.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
